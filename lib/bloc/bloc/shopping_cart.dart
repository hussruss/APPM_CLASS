import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:m1_s4/models/shopping_item.dart';

class ShoppingCartState {
  List<ShoppingItem> shoppingCart;
  int? total = 0;
  ShoppingCartState({required this.shoppingCart, required this.total});

  @override
  List<Object> get props => [];
}

abstract class ShoppingCartEvent {}

class AddItemEvent extends ShoppingCartEvent {
  final ShoppingItem item;
  AddItemEvent({required this.item});
  @override
  List<Object> get props => [];
}

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartState _shoppingCartState =
      ShoppingCartState(shoppingCart: [], total: 0);

  ShoppingCartBloc() : super(ShoppingCartState(shoppingCart: [], total: 0)) {
    on<AddItemEvent>((event, emit) {
      _shoppingCartState = ShoppingCartState(
          shoppingCart: List.of(_shoppingCartState.shoppingCart)
            ..add(event.item),
          total: 0);

      emit(_shoppingCartState);
    });
  }
}
