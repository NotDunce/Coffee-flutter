import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {

  //list of coffee types on sale 

  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color];
    ["Hot Chocolate", "6.00", "lib/images/chocolate.png", Colors.brown],
    ["Iced Tea", "4.30", "lib/images/iced_tea.png", Colors.orange],
    ["Milkshake", "7.00", "lib/images/Milkshake.png", Colors.pink],
    ["Espresso", "6.00", "lib/images/betterEspresso.png", Colors.yellow],
    
  ];

  //list of coffee cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart 
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners(); //helps all of the other widgets to update the data
  }

  //remove item from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal(){
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2); //returns a string of a number to a fixed 2 decimal points
  }

}