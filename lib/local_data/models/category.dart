class CategoryModel {
  int position;
  String vector;
  bool isSelected;

  CategoryModel(
      {required this.position, required this.vector, required this.isSelected});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        position: 1,
        vector: 'assets/images/burgericon11.png',
        isSelected: true));
    categories.add(CategoryModel(
        position: 2,
        vector: 'assets/images/drinkicon11.png',
        isSelected: false));
    categories.add(CategoryModel(
        position: 3,
        vector: 'assets/images/cheesecakeicon11.png',
        isSelected: false));
    categories.add(CategoryModel(
        position: 4,
        vector: 'assets/images/pizza_simple.jpg',
        isSelected: false));
    return categories;
  }
}
