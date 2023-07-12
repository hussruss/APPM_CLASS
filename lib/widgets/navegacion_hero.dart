import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NavegacionHero extends StatefulWidget {
  const NavegacionHero({super.key});

  @override
  State<NavegacionHero> createState() => _NavegacionHeroState();
}

class _NavegacionHeroState extends State<NavegacionHero> {
  late Future<List<HeroItem>> _heroFetch;

  @override
  void initState() {
    // TODO: implement initState
    _heroFetch = fetchHero();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero App'),
      ),
      body: FutureBuilder<List<HeroItem>>(
          future: _heroFetch,
          builder: (context, snapShot) {
            return Container();
          }),
    );
  }
}

class HeroItem {
  final String id;
  final String name;
  final String imgUrl;
  final String desc;

  HeroItem(this.id, this.name, this.imgUrl, this.desc);
}

Future<List<HeroItem>> fetchHero() async {
  const String url =
      'https://superheroapi.com/api/833212131523300/search/batman';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final List<dynamic> results = body['results'];
    final List<HeroItem> heroes = results
        .map((e) => HeroItem(e['id'], e['name'], e['image']['url'], ''))
        .toList();
    return heroes;
  } else {
    throw Exception();
  }
}
