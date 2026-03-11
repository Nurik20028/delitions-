import 'package:flutter/material.dart';
import 'package:delitions_nurislam_ain_1_24/local_data/models/drinkModel.dart';
import 'package:delitions_nurislam_ain_1_24/local_data/models/orderModel.dart';

class DetailPage extends StatefulWidget{
  final dynamic snackModel;

  const DetailPage({super.key, required this.snackModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController textAddressReader = TextEditingController();

  int counter = 1;
  int _selectedSpeciesIndex = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }

  @override
  void dispose() {
    textAddressReader.dispose();
    super.dispose();
  }

  String _getSnackName() {
    try {
      return widget.snackModel.name ?? 'Unknown Product';
    } catch (e) {
      return 'Unknown Product';
    }
  }

  double _getSnackPrice() {
    try {
      return (widget.snackModel.price as num?)?.toDouble() ?? 0.0;
    } catch (e) {
      return 0.0;
    }
  }

  String _getSnackImage() {
    try {
      return widget.snackModel.image?.toString() ?? '';
    } catch (e) {
      return '';
    }
  }

  String _getSnackDescription() {
    try {
      return widget.snackModel.description?.toString() ?? '';
    } catch (e) {
      return '';
    }
  }

  List<String>? _getLevels_list() {
    if (widget.snackModel is DrinkModel) {
      return null;
    }
    try {
      return (widget.snackModel.speciesLevel as List?)
          ?.map((e) => e.toString())
          .toList();
    } catch (ex) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String snackName = _getSnackName();
    final double snackPrice = _getSnackPrice();
    final String snackImage = _getSnackImage();
    final String snackDescription = _getSnackDescription();
    final List<String>? levels_list = _getLevels_list();

    return Scaffold(
      backgroundColor: const Color(0xffe8ede8),
      appBar: AppBar(
          backgroundColor: const Color(0xffd7fada),
          centerTitle: true,
          toolbarHeight: 44,
          leadingWidth: 100,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: const Color(0xffe3f5e5),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff151414).withOpacity(0.7),
                          offset: const Offset(0, 4),
                          blurRadius: 20)
                    ]),
                child: const Icon(Icons.arrow_back),
              )),
          title: const Text(
            'Delisious',
            style: TextStyle(fontSize: 16),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoSnackDescription(snackName, snackPrice, snackImage,
                  snackDescription, levels_list),
              const SizedBox(height: 16),
              counterProduct(),
              const SizedBox(height: 16),
              makeOrder(snackName, snackPrice, levels_list ?? [])
            ],
          ),
        ),
      ),
    );
  }

  Widget infoSnackDescription(String snackName, double snackPrice,
      String snackImage, String snackDescription, List<String>? levels_list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          child: Row(
            children: [
              Container(
                  width: 186,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(16),
                      image: snackImage.isNotEmpty
                          ? DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(snackImage))
                          : null)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snackName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/priceRedSmolliconLable.png'),
                                  )),
                            ),
                          ),
                          Text(
                            snackPrice.toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          snackDescription,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 16),
        (levels_list != null && levels_list.isNotEmpty)
            ? SizedBox(
          height: 50,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: levels_list.length,
              separatorBuilder: (context, index) =>
              const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final bool isSelected = index == _selectedSpeciesIndex;
                return ChoiceChip(
                  label: Text(levels_list[index]),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() => _selectedSpeciesIndex = index);
                  },
                  selectedColor: Colors.redAccent,
                  labelStyle: TextStyle(
                      color:
                      isSelected ? Colors.white : Colors.redAccent),
                );
              }),
        )
            : SizedBox(height: 20)
      ],
    );
  }

  Widget counterProduct() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      IconButton(
        icon: const Icon(Icons.remove_circle_outline),
        color: Colors.black26,
        onPressed: decrement,
      ),
      Text(
        counter.toString(),
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      IconButton(
        icon: const Icon(Icons.add_circle_outline),
        color: Colors.black26,
        onPressed: increment,
      ),
    ]);
  }

  Widget makeOrder(
      String snackName, double snackPrice, List<String> snackSpeciesLevels) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: textAddressReader,
          decoration: const InputDecoration(
              hintText: 'Input delivery address: ',
              hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.home_work_outlined,
                color: Colors.black54,
                size: 14,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(6.0)))),
        ),
        const SizedBox(height: 8),
        MaterialButton(
            height: 36,
            minWidth: double.infinity,
            elevation: 0,
            color: const Color(0xff55cc60),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: const Text(
              'Сделать заказ',
              style: TextStyle(
                  color: Color(0xff023d08),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              String clientAddress = textAddressReader.text;
              if (clientAddress.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a delivery address.'),
                    backgroundColor: Colors.orange,
                  ),
                );
                return;
              }

              String selectedSpecies;
              if (snackSpeciesLevels.isEmpty) {
                selectedSpecies = 'Standard';
              } else if (_selectedSpeciesIndex >= 0 &&
                  _selectedSpeciesIndex < snackSpeciesLevels.length) {
                selectedSpecies = snackSpeciesLevels[_selectedSpeciesIndex];
              } else {
                selectedSpecies = snackSpeciesLevels[0];
              }

              OrderModel currentOrder = OrderModel(
                  nameProduct: snackName,
                  countProduct: counter,
                  sumProduct: snackPrice * counter,
                  speciecLevel: selectedSpecies,
                  clientAdress: clientAddress);

              _showConfirmationDialog(currentOrder);
            }),
      ],
    );
  }

  Future<void> _showConfirmationDialog(OrderModel currentOrder) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Your Order'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Product: '),
                Text(currentOrder.nameProduct,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.redAccent)),
                const SizedBox(height: 26),
                const Text('Quantity:'),
                Text('${currentOrder.countProduct}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.redAccent)),
                const SizedBox(height: 26),
                const Text('species: '),
                Text(currentOrder.speciecLevel,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.redAccent)),
                const SizedBox(height: 26),
                const Text('Total Price:'),
                Text('\$${currentOrder.sumProduct.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.redAccent)),
                const SizedBox(height: 26),
                const Text('Delivery Address:'),
                Text(
                    currentOrder.clientAdress.isEmpty
                        ? "Not provided"
                        : currentOrder.clientAdress,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.redAccent)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Ok',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _showOrderAcceptedDialog(acceptedOrder: currentOrder);
                print('Order Confirmed: ${currentOrder.nameProduct}');
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showOrderAcceptedDialog(
      {required OrderModel acceptedOrder}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Order Accepted!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Your order for:   '),
                Text(acceptedOrder.nameProduct,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.redAccent)),
                const Text('has been successfully placed.',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 22,
                        color: Colors.black)),
                const SizedBox(height: 30),
                const Text('It will be delivered to:   ',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 22,
                        color: Colors.black)),
                Text(
                    acceptedOrder.clientAdress.isEmpty
                        ? " Not provided address"
                        : acceptedOrder.clientAdress,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.redAccent)),
                const SizedBox(height: 30),
                const Text('Thank you for order!',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: Colors.black)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
