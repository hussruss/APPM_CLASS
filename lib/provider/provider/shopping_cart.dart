import 'package:flutter/material.dart';
import 'package:m1_s4/models/shopping_item.dart';

class ShoppingCartStateProvider with ChangeNotifier {
  List<ShoppingItem> _shoppingCart = [];

  List<ShoppingItem> get shoppingCart => _shoppingCart;

  void addItem(ShoppingItem item) {
    _shoppingCart = List.of(_shoppingCart)..add(item);
    notifyListeners();
  }
}
