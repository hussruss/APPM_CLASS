import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m1_s4/youtube/data.dart';
import 'package:m1_s4/youtube/models/video.dart';
import 'package:m1_s4/youtube/widgets/short.dart';
import 'package:m1_s4/youtube/widgets/video.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  final List<dynamic> _feed = [
    videoList[0],
    [shortsList[0], shortsList[1]],
    videoList[1],
    videoList[2],
    videoList[3],
    videoList[4]
  ];
  final List<Widget> _actions = [
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.cast,
          size: 25,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_none_rounded,
          size: 25,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          size: 25,
        )),
    const CircleAvatar(
      backgroundColor: Colors.blue,
      child: Text(
        'R',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    )
  ];

  final List<BottomNavigationBarItem> _listNavBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Principal'),
    BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shorts'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.control_point_rounded,
          size: 40,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions_outlined), label: 'Suscripciones'),
    BottomNavigationBarItem(
        icon: Icon(Icons.video_library_outlined), label: 'Biblioteca')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: SvgPicture.asset(
            'assets/images/youtube-logo.svg',
          ),
          leadingWidth: 120,
          actions: _actions),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          _buildSections(),
          SizedBox(
            height: 10,
          ),
          ..._feed.map((e) => _buildContent(e)).toList()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          items: _listNavBarItems),
    );
  }

  Widget _buildContent(dynamic item) {
    if (item is Video) {
      return VideoWidget(video: item);
    } else if (item is List<Short>) {
      return SizedBox(
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset(
                'assets/images/short.png',
                height: 40,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: item.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShortWidget(short: item[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  SizedBox _buildSections() {
    return SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Icon(Icons.navigation_outlined))),
            const SizedBox(width: 20),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Todos',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ))),
            const SizedBox(width: 20),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Música',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))),
            const SizedBox(width: 20),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Series de televisión',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))),
            const SizedBox(width: 20),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Pódcast',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))),
            const SizedBox(width: 20),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Mixes',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))),
          ],
        ));
  }
}
