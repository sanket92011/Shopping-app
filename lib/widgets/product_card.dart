import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.onClick});

  final String productName;
  final String productPrice;
  final String productImage;
  final VoidCallback onClick;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 410,
        child: GestureDetector(
          onTap: widget.onClick,
          child: Card(
            color: Colors.lightBlueAccent.shade100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.productPrice,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    widget.productImage,
                    width: double.infinity,
                    height: 300,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
