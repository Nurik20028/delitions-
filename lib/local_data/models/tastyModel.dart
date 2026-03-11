import 'package:flutter/material.dart';

class TastyModel {
  String name;
  String image;
  Color colorBox;
  List<String> speciesLevel;
  String description;
  double price;

  TastyModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.speciesLevel,
    required this.description,
    required this.price,
  });

  static List<TastyModel> getMainListCakes() {
    List<TastyModel> mainListCakes = [];

    mainListCakes.add(TastyModel(
      name: 'Chokolate  cake',
      image: 'assets/images/cake88chokolate.jpg',
      colorBox: const Color(0xffcff5cf),
      speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
      description:
      'Нежный десерт Нежный десерт Нежный десерт Нежный десерт Нежный десерт',
      price: 12.8,
    ));

    mainListCakes.add(TastyModel(
      name: 'Limon cake',
      image: 'assets/images/cake88lime.jpg',
      colorBox: const Color(0xffeadbfd),
      description:
      'Нежный десерт Нежный десерт Нежный десерт Нежный десерт Нежный десерт',
      speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
      price: 14.5,
    ));

    mainListCakes.add(TastyModel(
      name: 'Cheese cake',
      image: 'assets/images/cake88yellow.jpg',
      colorBox: const Color(0xfffccee5),
      speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
      description:
      'Нежный десерт Нежный десерт Нежный десерт Нежный десерт Нежный десерт',
      price: 16.2,
    ));

    mainListCakes.add(TastyModel(
      name: 'Chokolate  cake',
      image: 'assets/images/cake88chokolate.jpg',
      colorBox: const Color(0xffcff5cf),
      speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
      description:
      'Нежный десерт Нежный десерт Нежный десерт Нежный десерт Нежный десерт',
      price: 12.8,
    ));

    mainListCakes.add(TastyModel(
      name: 'Limon cake',
      image: 'assets/images/cake88lime.jpg',
      colorBox: const Color(0xffeadbfd),
      speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
      description:
      'Нежный десерт Нежный десерт Нежный десерт Нежный десерт Нежный десерт',
      price: 14.5,
    ));

    return mainListCakes;
  }
}
