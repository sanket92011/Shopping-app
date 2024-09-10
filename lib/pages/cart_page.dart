import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/CartProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: cart.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                final cartItems = cart[index];
                final selectedCartItem = cartItems['title'];

                return ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cartItems);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ))
                            ],
                            title: const Text(
                              "Delete Product",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            content: Text(
                              "Are you sure you want to remove $selectedCartItem from the cart?",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      );
                      debugPrint("Item removed");
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      cartItems['imageUrl'].toString(),
                    ),
                  ),
                  title: Text(
                    cartItems['title'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(
                    cartItems['sizes'].toString(),
                  ),
                );
              },
              itemCount: cart.length,
            )
          : const Center(
              child: Text(
                "Nothing is added to cart yet",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
    );
  }
}
