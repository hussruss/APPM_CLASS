import 'package:flutter/material.dart';
import 'package:m1_s4/inheritedWidget/state/shopping_cart.dart';
import 'package:m1_s4/provider/provider/shopping_cart.dart';
import 'package:m1_s4/provider/screens/cart.dart';
import 'package:m1_s4/provider/screens/home.dart';
import 'package:provider/provider.dart';

class ShoppingProviderApp extends StatelessWidget {
  const ShoppingProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoppingCartStateProvider()),
      ],
      child: MaterialApp(
          title: 'Provider App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            '/cart': (context) => CartScreen(),
          }),
    );
  }
}
