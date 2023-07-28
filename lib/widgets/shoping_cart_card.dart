import 'package:flutter/material.dart';
import 'package:m1_s4/models/shopping_item.dart';

class ShoppingItemCard extends StatelessWidget {
  final ShoppingItem item;
  final Function(ShoppingItem) onAddItem;
  const ShoppingItemCard(
      {required this.item, required this.onAddItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 340,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
        ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
        // borderRadius:
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 180,
              child: Image.network(item.image!)),
          const SizedBox(height: 10),
          Chip(
              backgroundColor: Color.fromARGB(255, 0, 94, 170),
              label: Text(
                item.category!,
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(height: 10),
          Text(
            ' \$${item.price!.toString()}.00',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            '${item.description}',
            style: TextStyle(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Chip(
              padding: EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Color.fromARGB(255, 167, 248, 130),
              label: Text(
                'Full',
                style: TextStyle(color: Color.fromARGB(255, 13, 110, 0)),
              )),
          const SizedBox(height: 10),
          Container(
              width: 400,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 34, 185),
                  ),
                  onPressed: () {
                    onAddItem(item);
                  },
                  child: Text('Add to cart')))
        ],
      ),
    );
  }
}
