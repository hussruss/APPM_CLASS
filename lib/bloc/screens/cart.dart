import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m1_s4/bloc/bloc/shopping_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 400,
      child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.shoppingCart.length,
                  itemBuilder: (context, index) {
                    final item = state.shoppingCart[index];
                    return ListTile(
                      leading: Image.network(item.image!),
                      title: Text(item.title!),
                      subtitle: Text(
                        item.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        ' \$${item.price!.toString()}.00',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('TOTAL:'),
                trailing: Text(
                  ' \$${state.total}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Pay out')))
            ],
          );
        },
      ),
    );
  }
}
