import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/products_model.dart';
import 'package:shopping_app/pages/products_details_page.dart';
import 'package:shopping_app/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = [
    'All',
    'Addidas',
    'Nike',
    'Bata',
  ];
  late String selectedChip;

  @override
  void initState() {
    super.initState();
    selectedChip = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedChip = filter;
                        });
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: selectedChip == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side: BorderSide.none,
                        labelStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.all(15),
                        label: Text(
                          filter,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (selectedChip == filters[0])
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                        onClick: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return ProductsDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        productName: product['title'] as String,
                        productPrice: product['price'].toString(),
                        productImage: product['imageUrl'] as String);
                  },
                  itemCount: products.length,
                ),
              ),
            if (selectedChip == filters[1]) const Text("Addidas Section"),
            if (selectedChip == filters[2]) const Text("Nike Section"),
            if (selectedChip == filters[3]) const Text("Bata Section"),
          ],
        ),
      ),
    );
  }
}
