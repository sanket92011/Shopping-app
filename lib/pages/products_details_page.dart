import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/products_model.dart';
import 'package:shopping_app/provider/CartProvider.dart';

class ProductsDetailsPage extends StatefulWidget {
  const ProductsDetailsPage({super.key, required this.product});

  final Map<String, Object> product;

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  late int selectedSize = 0;

  @override
  void initState() {
    super.initState();
    selectedSize;
  }

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectedSize,
      });
      debugPrint("Button pressed");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Text(
                widget.product['title'].toString(),
              ),
              const Text(" Added to cart")
            ],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'].toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Image.asset(
                  widget.product['imageUrl'].toString(),
                  height: 250,
                )
              ],
            ),
          ),
          const Spacer(flex: 2),
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  widget.product['price'].toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final sizes =
                          (products[index]['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                selectedSize = sizes;
                              },
                            );
                          },
                          child: Chip(
                            label: Text(
                              sizes.toString(),
                            ),
                            backgroundColor: selectedSize == sizes
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                    itemCount: (products[2]['sizes'] as List<int>).length,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: SizedBox(
                    height: 50,
                    child: FilledButton(
                        onPressed: onTap,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.black,
                            ),
                            Text(
                              "  Add to cart",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
    );
  }
}
