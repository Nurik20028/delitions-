import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Добавленный импорт
import 'package:delitions_nurislam_ain_1_24/local_data/models/burgerModel.dart';
import 'package:delitions_nurislam_ain_1_24/local_data/models/category.dart';
import 'package:delitions_nurislam_ain_1_24/local_data/models/drinkModel.dart';
import 'package:delitions_nurislam_ain_1_24/local_data/models/tastyModel.dart';
import '../local_data/models/pizzaModel.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<BurgerModel> burgerData = BurgerModel.getMainListBurgers();
  final List<DrinkModel> drinkData = DrinkModel.getMainListJuices();
  final List<CategoryModel> categoryData = CategoryModel.getCategories();
  final List<TastyModel> cakesData = TastyModel.getMainListCakes();
  final List<PizzaModel> pizzaData = PizzaModel.getMainListPizzas();

  final AudioPlayer _audioPlayer = AudioPlayer();

  List<Object> itemsToDisplay = [];
  int selectedCategoryIndex = 0;

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Object> allSnacks = [];

  // --- Цветовая палитра в стиле Кафе ---
  final Color bgColor = const Color(0xFFFAF3E0); // Теплый кремовый (латте)
  final Color headerColor = const Color(0xFFEFEBE9); // Светлый мокко
  final Color textColor = const Color(0xFF4E342E); // Темный шоколад/эспрессо
  final Color accentColor = const Color(0xFFD84315); // Теплый терракотовый

  @override
  void initState() {
    super.initState();
    allSnacks.addAll(burgerData);
    allSnacks.addAll(drinkData);
    allSnacks.addAll(cakesData);
    allSnacks.addAll(pizzaData);

    _updateListOnCategory();

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
        _performSearch();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _updateListOnCategory() {
    List<Object> currentCategoryList = [];
    switch (selectedCategoryIndex) {
      case 0:
        currentCategoryList = List.from(burgerData);
        break;
      case 1:
        currentCategoryList = List.from(drinkData);
        break;
      case 2:
        currentCategoryList = List.from(cakesData);
        break;
      case 3:
        currentCategoryList = List.from(burgerData);
        break;
      default:
        currentCategoryList = List.from(pizzaData);
        break;
    }
    itemsToDisplay = currentCategoryList;
  }

  void _performSearch() {
    if (_searchQuery.isEmpty) {
      _updateListOnCategory();
    } else {
      itemsToDisplay = allSnacks.where((item) {
        String searchText = '';
        if (item is BurgerModel) searchText = item.name;
        if (item is TastyModel) searchText = item.name;
        if (item is DrinkModel) searchText = item.d_name;
        if (item is PizzaModel) searchText = item.name;

        return searchText.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor, // Изменен фон Scaffold
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(height: 10),
              categories(),
              snacks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: headerColor, // Изменен цвет хедера
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Drive NURIS Delicious',
                    style: GoogleFonts.caveat( // Рукописный шрифт для подзаголовка
                      fontSize: 22,
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Welcome back!',
                    style: GoogleFonts.pacifico( // Красивый изогнутый шрифт для главного заголовка
                      fontSize: 28,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/pizza_simple.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.08), // Коричневая тень
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: 'Search all snacks...',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                prefixIcon: Icon(Icons.search, color: textColor),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () => _searchController.clear(),
                )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Categories",
            style: GoogleFonts.pacifico( // Изогнутый шрифт для заголовка категорий
              fontSize: 24,
              color: textColor,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: categoryData.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final isSelected = selectedCategoryIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (var item in categoryData) {
                      item.isSelected = false;
                    }
                    categoryData[index].isSelected = true;
                    selectedCategoryIndex = index;

                    if (_searchQuery.isNotEmpty) {
                      _searchController.clear();
                    } else {
                      _updateListOnCategory();
                    }
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? accentColor : Colors.white, // Используем теплый акцентный цвет
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? accentColor.withOpacity(0.4)
                                : Colors.brown.withOpacity(0.05),
                            offset: const Offset(0, 4),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          categoryData[index].vector,
                          fit: BoxFit.scaleDown,
                          // Если иконки черные, можно раскомментировать строку ниже для перекраски
                          // color: isSelected ? Colors.white : textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget snacks() {
    if (itemsToDisplay.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.fastfood_outlined, size: 60, color: Colors.grey.shade300),
              const SizedBox(height: 16),
              Text(
                _searchQuery.isNotEmpty
                    ? 'No results found for "$_searchQuery"'
                    : 'No items in this category yet.',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: itemsToDisplay.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        dynamic item = itemsToDisplay[index];
        String name = '';
        String imagePath = '';
        Color itemColorBox = Colors.grey.shade200;
        List<String> itemSpeciesLevel = [];
        double itemPrice = 0.0;

        if (item is BurgerModel) {
          name = item.name;
          imagePath = item.image;
          itemColorBox = item.colorBox;
          itemSpeciesLevel = item.speciesLevel;
          itemPrice = item.price;
        } else if (item is TastyModel) {
          name = item.name;
          imagePath = item.image;
          itemColorBox = item.colorBox;
          itemSpeciesLevel = item.speciesLevel;
          itemPrice = item.price;
        } else if (item is DrinkModel) {
          name = item.d_name;
          imagePath = item.image;
          itemSpeciesLevel = ['Drink'];
          itemPrice = item.price;
        } else if (item is PizzaModel) {
          name = item.name;
          imagePath = item.image;
          itemColorBox = item.colorBox;
          itemSpeciesLevel = item.crustTypes;
          itemPrice = item.price;
        }

        return GestureDetector(
          onTap: () async {
            await _audioPlayer.play(AssetSource('sounds/f0ca9eb53fa629d.mp3'));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(snackModel: itemsToDisplay[index]),
              ),
            );
          },
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.06), // Мягкая кофейная тень
                  offset: const Offset(0, 6),
                  blurRadius: 16,
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 110,
                  decoration: BoxDecoration(
                    color: itemColorBox.withOpacity(0.2), // Сделал фон картинок чуть прозрачнее для нежности
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.caveat( // Красивый рукописный шрифт для названия
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            height: 1.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (itemSpeciesLevel.isNotEmpty)
                          Text(
                            itemSpeciesLevel.length > 1
                                ? itemSpeciesLevel[1]
                                : itemSpeciesLevel[0],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        Row(
                          children: [
                            Text(
                              '\$ ',
                              style: TextStyle(
                                color: accentColor, // Акцентный цвет для знака доллара
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              itemPrice.toStringAsFixed(2),
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}