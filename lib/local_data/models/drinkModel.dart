class DrinkModel {
  String d_name;
  String image;
  String description;
  List<String> speciesLevel;
  double price;

  DrinkModel({
    required this.d_name,
    required this.image,
    required this.description,
    required this.speciesLevel,
    required this.price,
  });

  static List<DrinkModel> getMainListJuices() {
    List<DrinkModel> mainListJuices = [];
    mainListJuices = [
      DrinkModel(
        d_name: 'Pomelo juice',
        image: 'assets/images/pomelo_juice.png',
        description: ' fresh fruit juice fresh fruit juice '
            ' fresh fruit juice'
            'fresh fruit juice fresh fruit juice fresh fruit juice '
            'fresh fruit juice fresh fruit juice',
        speciesLevel: ['', '', ''],
        price: 2.5,
      ),
      DrinkModel(
        d_name: 'Strawberry juice',
        image: 'assets/images/strawberry_juice.png',
        description: ' fresh fruit juice fresh fruit juice '
            ' fresh fruit juice'
            'fresh fruit juice fresh fruit juice fresh fruit juice '
            'fresh fruit juice fresh fruit juice',
        speciesLevel: ['', '', ''],
        price: 1.5,
      ),
      DrinkModel(
        d_name: 'Lemon juice',
        image: 'assets/images/lemon_juice.png',
        description: ' fresh fruit juice fresh fruit juice '
            ' fresh fruit juice'
            'fresh fruit juice fresh fruit juice fresh fruit juice '
            'fresh fruit juice fresh fruit juice',
        speciesLevel: ['', '', ''],
        price: 4.8,
      ),
      DrinkModel(
        d_name: 'Orange juice',
        image: 'assets/images/orange_juice.png',
        description: ' fresh fruit juice fresh fruit juice '
            ' fresh fruit juice'
            'fresh fruit juice fresh fruit juice fresh fruit juice '
            'fresh fruit juice fresh fruit juice',
        speciesLevel: ['', '', ''],
        price: 3.3,
      ),
    ];
    return mainListJuices;
  }
}
