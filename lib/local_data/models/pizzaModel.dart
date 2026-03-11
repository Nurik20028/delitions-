import 'package:flutter/material.dart';

class PizzaModel {
  String name;
  String image;
  Color colorBox;
  List<String> crustTypes; // Заменил speciesLevel на более подходящее для пиццы
  String description;
  double price;

  PizzaModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.crustTypes,
    required this.description,
    required this.price,
  });

  static List<PizzaModel> getMainListPizzas() {
    // Гораздо чище возвращать сразу заполненный список, а не делать .add() для каждого элемента
    return [
      PizzaModel(
        name: 'Margherita',
        image: 'assets/images/pizza_margherita.jpg',
        colorBox: const Color(0xfffddce8),
        crustTypes: ['Тонкое', 'Традиционное', 'Сырный бортик'],
        description: 'Классическая пицца с томатами, моцареллой и свежим базиликом.',
        price: 10.5,
      ),
      PizzaModel(
        name: 'Pepperoni',
        image: 'assets/images/pizza_pepperoni.jpg',
        colorBox: const Color(0xffffe4c4),
        crustTypes: ['Тонкое', 'Традиционное', 'Сырный бортик'],
        description: 'Острая пицца с двойной порцией пепперони и сыром моцарелла.',
        price: 12.0,
      ),
      PizzaModel(
        name: 'Four Cheeses',
        image: 'assets/images/pizza_4cheeses.jpg',
        colorBox: const Color(0xffcff5cf),
        crustTypes: ['Тонкое', 'Традиционное'],
        description: 'Идеальное сочетание моцареллы, чеддера, пармезана и дор блю.',
        price: 14.2,
      ),
      PizzaModel(
        name: 'BBQ Chicken',
        image: 'assets/images/pizza_bbq.jpg',
        colorBox: const Color(0xffeadbfd),
        crustTypes: ['Тонкое', 'Традиционное', 'Сырный бортик'],
        description: 'Сочная курица, красный лук, бекон и насыщенный соус барбекю.',
        price: 13.5,
      ),
    ];
  }
}