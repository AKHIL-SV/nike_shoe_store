import 'package:flutter/material.dart';

final List initialdata = [
  ['1', 'Concepts X Nike Sb Dunk Low', '270', 'assets/img/1.png'],
  ['1', 'Dessin Nike Air Max 720', '270', 'assets/img/2.png'],
  ['1', 'Nike Air Max 270 React', '270', 'assets/img/3.png'],
  ['1', 'Nike Air Max 720 Northern Lights', '270', 'assets/img/4.png'],
  ['1', 'Nike Air Max 720 Odell Beckham Jr', '270', 'assets/img/5.png'],
  ['1', 'Nike Air Max 720 Rose', '270', 'assets/img/6.png'],
  ['1', 'Nike Air Max 720 X Obj', '270', 'assets/img/7.png'],
  ['1', 'Nike Air Zoom Pegasus 33 Shield', '270', 'assets/img/8.png'],
  ['1', 'Nike Huarache Nm', '270', 'assets/img/9.png'],
  ['1', 'Nike Hyperace', '270', 'assets/img/10.png'],
  ['1', 'Nike Ispa Air Max 720', '270', 'assets/img/11.png'],
  ['1', 'Nike Kd 12 The Day One Black', '270', 'assets/img/12.png'],
  ['1', 'Nike Lebron Xi - Lebron Xi', '270', 'assets/img/13.png'],
  ['1', 'Nike Men S Air Zoom Hyperace 2', '270', 'assets/img/14.png'],
  ['1', 'Nike Nba Miami Force 1', '270', 'assets/img/15.png'],
  ['1', 'Nike Pegasus 35 Shield Sklep', '270', 'assets/img/16.png'],
  ['1', 'Nike Sb Diamond Supply Co', '270', 'assets/img/17.png'],
  ['1', 'Nike Shoes Legend React', '270', 'assets/img/18.png'],
  ['1', 'Nike W Air Max 720 Se Gym Red', '270', 'assets/img/19.png'],
  ['1', 'Nike Zoom Pegasus 33 Light Pink', '270', 'assets/img/20.png'],
  ['1', 'Nike Air Force 1 Low Winter', '270', 'assets/img/21.png'],
];

class Items extends ChangeNotifier {
  final List _products = initialdata;
  final List _cart = [];

  List get cartitems => _cart;
  List get products => _products;
  void addtocart(int index) {
    _cart.add(_products[index]);
    notifyListeners();
  }

  void removefromcart(int index) {
    _cart.remove(_cart[index]);
    notifyListeners();
  }
}
