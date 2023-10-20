import 'package:flutter/material.dart';
import 'package:shopapp/cart_provider.dart';
// import 'package:shopapp/global_variables.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart;
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
        appBar: AppBar(title: const Text('sadsda')),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
                radius: 30.0,
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Product',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        content: Text(
                          'Are you sure want to delete this product?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .removeFromCart(cartItem);
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeFromCart(cartItem);
                              Navigator.pop(context);
                            },
                            child: const Text('Remove'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(
                cartItem['title'].toString(),
              ),
              subtitle: Text('Size: ${cartItem['sizes']}'),
            );
          },
        ));
  }
}
