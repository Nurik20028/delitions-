import 'package:flutter/material.dart';

class BurgerModel {
  String name;
  String image;
  Color colorBox;
  List<String> speciesLevel;
  String description;
  double price;

  BurgerModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.speciesLevel,
    required this.description,
    required this.price,
  });
  static List<BurgerModel> getMainListBurgers() {
    List<BurgerModel> mainListBurgers = [];
    mainListBurgers = [
      BurgerModel(
        name: 'Peppers Burger',
        image: 'assets/images/hot_pepper_burger.png',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: [
          'much  very peppers',
          'middle peppers',
          'super mix peppers'
        ],
        description:
        ' much  very species  much  very species  much  very species '
            ' much  very species'
            'Peppers Burger Peppers Burger Peppers Burger Peppers Burger '
            'Peppers Burger much  very species  much  very species',
        price: 5.5,
      ),
      BurgerModel(
        name: 'Cheese Burger',
        image: 'assets/images/cheese_burger03.png',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: ['much  very cheese', 'middle cheese'],
        description:
        ' Very delishious cheese_burger Very delishious cheese_burger '
            'Very delishious cheese_burger Very delishious cheese_burger '
            'Very delishious cheese_burger Very delishious cheese_burger ',
        price: 6.5,
      ),
      BurgerModel(
        name: 'Veget Burger',
        image: 'assets/images/veget_bureger02.png',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: ['much  very vegetables', 'middle vegetables'],
        description:
        ' Vegetables Burger Vegetables Burger Vegetables Burger Vegetables Burger '
            'Vegetables Burger Vegetables Burger Vegetables Burger Vegetables Burger'
            'Vegetables Burger Vegetables Burger Vegetables Burger Vegetables Burger',
        price: 4.5,
      ),
      BurgerModel(
        name: 'Super Double Burger',
        image: 'assets/images/double_burger.png',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: [
          'much  very peppers',
          'middle peppers',
          'super mix peppers'
        ],
        description:
        'Super delicious  Super Double Burger Super Double Burger Super Double'
            ' Burger Super Double Burger '
            'Super Double Burger Super Double Burger Super Double Burger Super '
            'Double Burger '
            'Super Double Burger  Super Double Burger',
        price: 2.5,
      ),
    ];
    return mainListBurgers;
  }
}
