import 'package:flutter/material.dart';
import 'package:m1_s4/models/item.dart';
import 'package:m1_s4/pages/items/addItem.dart';
import 'package:m1_s4/pages/items/editItem.dart';
import 'package:m1_s4/services/item.service.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late Future<List<Item>> futureItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureItems = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: Center(
        child: FutureBuilder<List<Item>>(
          future: futureItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Item> items = snapshot.data!;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(items[index].id.toString()),
                    onDismissed: (direction) async {
                      await deleteItem(items[index].id);
                      setState(() {
                        items.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Item deleted')));
                    },
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(items[index].name),
                      subtitle: Text(items[index].description),
                      trailing: Text(items[index].id.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditItemScreen(item: items[index]),
                          ),
                        ).then((_) {
                          setState(() {
                            futureItems = fetchItems();
                          });
                        });
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItemScreen(),
            ),
          ).then((_) {
            setState(() {
              futureItems = fetchItems();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
