import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NavegacionHero extends StatefulWidget {
  const NavegacionHero({super.key});

  @override
  State<NavegacionHero> createState() => _NavegacionHeroState();
}

class _NavegacionHeroState extends State<NavegacionHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegación'),
      ),
    );
  }
}
