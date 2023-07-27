import 'package:flutter/material.dart';
import 'package:m1_s4/models/shopping_item.dart';

class ShoppingCartState extends InheritedWidget {
  ShoppingCartState({super.key, required this.child}) : super(child: child);

  final Widget child;

  static ShoppingCartState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShoppingCartState>();
  }

  @override
  bool updateShouldNotify(ShoppingCartState oldWidget) {
    return true;
  }

  final ValueNotifier<List<ShoppingItem>> shoppingCartListener =
      ValueNotifier<List<ShoppingItem>>([]);

  List<ShoppingItem> get shoppingCart => shoppingCartListener.value;

  void addItem(ShoppingItem item) {
    shoppingCartListener.value = List.of(shoppingCartListener.value)..add(item);
    shoppingCartListener.notifyListeners();
  }
}
