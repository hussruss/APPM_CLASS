import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: RefreshIndicatorScreen(),
    );
  }
}

class ListViewBasic extends StatelessWidget {
  ScrollController _controller = ScrollController();
  List<int> lst = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          reverse: false,
          controller: _controller,
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
          clipBehavior: Clip.hardEdge,
          children: lst
              .map((e) => _buildContainer(
                  e.toString(), Colors.primaries[e % Colors.primaries.length]))
              .toList()
          // [
          //   _buildContainer('Uno', Colors.blue),
          //   _buildContainer('Dos', Colors.green),
          //   _buildContainer('Tres', Colors.red),
          //   _buildContainer('Cuatro', Colors.orange),
          //   _buildContainer('Cinco', Colors.yellow),
          //   _buildContainer('Seis', Colors.blue),
          //   _buildContainer('Siete', Colors.purple),
          // ],
          ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.plus_one),
        color: Colors.blue,
        onPressed: () {
          _controller.jumpTo(820);
        },
      ),
    );
  }
}

class ListViewBuilderE extends StatelessWidget {
  ScrollController _controller = ScrollController();
  List<int> lst = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: false,
        controller: _controller,
        //itemCount: 100,
        itemBuilder: ((context, index) {
          return _buildContainer(index.toString(),
              Colors.primaries[index % Colors.primaries.length]);
        }),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.plus_one),
        color: Colors.blue,
        onPressed: () {
          _controller.animateTo(
            2000,
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 2),
          );
        },
      ),
    );
  }
}

class ListViewBuilderSeparatedE extends StatelessWidget {
  ScrollController _controller = ScrollController();
  List<int> lst = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        reverse: false,
        controller: _controller,
        itemCount: 100,
        itemBuilder: ((context, index) {
          return _buildContainer(index.toString(),
              Colors.primaries[index % Colors.primaries.length]);
        }),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 25,
            thickness: 5,
            color: Colors.blue,
            indent: 20,
            endIndent: 20,
          );
        },
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.plus_one),
        color: Colors.blue,
        onPressed: () {
          _controller.animateTo(
            2000,
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 2),
          );
        },
      ),
    );
  }
}

class ListViewBuilderContactE extends StatelessWidget {
  ScrollController _controller = ScrollController();
  List<int> lst = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: false,
        controller: _controller,
        itemCount: contacts.length,
        itemBuilder: ((context, index) {
          print(contacts[index].name);
          return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(contacts[index].name.substring(0, 1)),
              ),
              trailing: Icon(Icons.phone),
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].number.toString()),
              style: ListTileStyle.list);
        }),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.plus_one),
        color: Colors.blue,
        onPressed: () {
          _controller.animateTo(
            2000,
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 2),
          );
        },
      ),
    );
  }
}

Container _buildContainer(String title, Color color) {
  print('Render $title');
  return Container(
    height: 200,
    width: 100,
    color: color,
    child: Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    ),
  );
}

Card _buildItem(Item item, Color color) {
  print('Render $item');
  return Card(
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: color,
            height: 10,
          ),
          Image.network(
            item.imgUrl,
            height: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item.name,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                overflow: TextOverflow.ellipsis),
          ),
          Text(
            '\$ ${item.price}',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

List generos = ['Rock', 'Pop', 'Rap', 'Reggeaton', 'Corridos Tumbados'];

final degradosTitulo = <String>["A", "B", "C", "D", "E"];
final colorsDegrado = <int>[600, 300, 100, 50, 10];

//Referes Indicator
class RefreshIndicatorScreen extends StatelessWidget {
  const RefreshIndicatorScreen({Key? key}) : super(key: key);

  Future<void> onRefresh() async {
    // Impresión en consola del IDE
    debugPrint("Inicia función onRefresh");
    await Future.delayed(const Duration(seconds: 5));
    debugPrint("Espera del hilo de ejecución");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Refresh Indicator")),
        body: RefreshIndicator(
            color: Colors.green,
            displacement: 120,
            onRefresh: onRefresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(30),
              itemCount: degradosTitulo.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.blue[colorsDegrado[index]],
                  child:
                      Center(child: Text('Degrado ${degradosTitulo[index]}')),
                );
              },
            )));
  }
}

class Contact {
  final String name;
  final int number;

  Contact({required String this.name, required this.number});
}

List<Contact> contacts = <Contact>[
  Contact(name: 'Xavier', number: 55555555),
  Contact(name: 'Alberto', number: 11223344),
  Contact(name: 'Andres', number: 88995511),
  Contact(name: 'Jorge', number: 33557788),
  Contact(name: 'José', number: 55228899),
  Contact(name: 'Juan Pablo', number: 33665544),
  Contact(name: 'Juan', number: 11884466),
  Contact(name: 'Luis', number: 77885522),
  Contact(name: 'Omar', number: 66223311),
  Contact(name: 'Pool', number: 55665544),
  Contact(name: 'Rogelio', number: 15975355),
  Contact(name: 'Victor', number: 55185236),
  Contact(name: 'David', number: 75232221),
];

class Item {
  final String name;
  final double price;
  final String imgUrl;

  Item({required String this.name, required this.price, required this.imgUrl});
}

List<Item> items = [
  Item(
    name: 'Playera Básica Lisa Manga Corta Cuello Redondo Caballero Milano',
    price: 120.0,
    imgUrl:
        'https://cdn.shopify.com/s/files/1/0346/7558/9257/products/661-9025A_Playera_Basica_Lisa_Manga_Corta_Cuello_Redondo_Caballero_Milano_Tallas-Extras_e_1024x1024.jpg?v=1664405148',
  ),
  Item(
    name: 'Pantalón Vaquero Ajustado para Hombre',
    price: 89.99,
    imgUrl:
        'https://cdn.shopify.com/s/files/1/0312/5821/4444/products/VV-pantalon-mezclilla-wrangler-936wbk-negro-2.jpg?v=1684708030',
  ),
  Item(
    name: 'Vestido de Noche Elegante sin Mangas',
    price: 249.5,
    imgUrl: 'https://m.media-amazon.com/images/I/51nAARn7FfL._AC_SX522_.jpg',
  ),
  Item(
    name: 'Zapatillas Deportivas para Mujer',
    price: 79.9,
    imgUrl: 'https://m.media-amazon.com/images/I/71pSNO4LBuL._AC_SX395_.jpg',
  ),
  Item(
    name: 'Chaqueta de Cuero Genuino para Hombre',
    price: 299.99,
    imgUrl: 'https://m.media-amazon.com/images/I/61qRL7L9AxL._AC_UY1000_.jpg',
  ),
  // Agrega los demás artículos de manera similar
  // ...
  // ...
  Item(
    name: 'Gafas de Sol Polarizadas Unisex',
    price: 59.0,
    imgUrl: 'https://m.media-amazon.com/images/I/519NQwNO96L._AC_SX569_.jpg',
  ),
  Item(
    name: 'Bufanda de Lana Tejida a Mano',
    price: 34.5,
    imgUrl:
        'https://i.etsystatic.com/8503025/r/il/bd5715/657890456/il_570xN.657890456_jfd5.jpg',
  ),
  Item(
    name: 'Bolso de Cuero Genuino para Mujer',
    price: 179.99,
    imgUrl: 'https://m.media-amazon.com/images/I/71n+knMbX4L._AC_SX569_.jpg',
  ),
  Item(
    name: 'Reloj de Pulsera Analógico de Acero Inoxidable',
    price: 199.0,
    imgUrl: 'https://m.media-amazon.com/images/I/61Sa4LTT02L._AC_SX522_.jpg',
  ),

  Item(
    name: 'Camiseta de Algodón para Niños',
    price: 29.9,
    imgUrl: 'https://m.media-amazon.com/images/I/519WcZcICqL._AC_SX569_.jpg',
  ),
];
