import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.lightBlueAccent.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['title'].toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product['price'].toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        product['imageUrl'].toString(),
                        width: double.infinity,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
