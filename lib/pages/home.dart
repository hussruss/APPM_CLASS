import 'package:flutter/material.dart';
import 'package:m1_s4/utils/const.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: GridView.builder(
        itemCount: Const.itemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4),
        itemBuilder: (BuildContext context, int index) {
          return _buildItemButon(index, context);
        },
      ),
    );
  }

  GestureDetector _buildItemButon(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Const.itemList[index].route);
      },
      child: Card(
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.primaries[index % Colors.primaries.length].shade700,
                Colors.primaries[index % Colors.primaries.length].shade500,
                Colors.primaries[Colors.primaries.length == index
                    ? index % Colors.primaries.length
                    : index % Colors.primaries.length],
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(children: [
            Expanded(
                child: Icon(
              Const.itemList[index].icon,
              color: Colors.white,
              size: 50,
            )),
            Text(
              Const.itemList[index].title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }
}

class ButtonIconItem {
  final String title;
  final IconData icon;
  final String route;

  ButtonIconItem(this.title, this.icon, this.route);
}
