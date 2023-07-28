import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m1_s4/bloc/bloc/shopping_cart.dart';
import 'package:m1_s4/bloc/screens/cart.dart';
import 'package:m1_s4/bloc/screens/home.dart';

class ShoppingBlocApp extends StatelessWidget {
  const ShoppingBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bloc App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/cart': (context) => CartScreen(),
        });
  }
}
