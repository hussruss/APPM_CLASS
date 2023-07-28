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
    _heroFetch = fetchHero();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero App'),
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<List<HeroItem>>(
          future: _heroFetch,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  ...snapShot.data!.map((e) => ItemCard(item: e)).toList()
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}

class ItemCard extends StatelessWidget {
  final HeroItem item;
  const ItemCard({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HeroDetails(item: item)));
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  item.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(item.name),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroDetails extends StatelessWidget {
  final HeroItem item;
  const HeroDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        Card(
          child: Image.network(
            item.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          item.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        )
      ]),
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
      'https://superheroapi.com/api/833212131523300/search/super';

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
