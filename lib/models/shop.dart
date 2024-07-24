// food menu
import 'package:flutter/material.dart';
import 'package:sushirestaurantapp/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
        name: "Salman Sushi",
        price: "21",
        imagePath: "assets/images/sushi1.png",
        rating: "4.8"),
    // tuna
    Food(
        name: "tuna",
        price: "10",
        imagePath: "assets/images/sushi2.png",
        rating: "4.3"),
    Food(
        name: "maki",
        price: "10",
        imagePath: "assets/images/sushi3.png",
        rating: "4.3"),
    Food(
        name: "chirashi",
        price: "10",
        imagePath: "assets/images/sushi4.png",
        rating: "4.3"),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
