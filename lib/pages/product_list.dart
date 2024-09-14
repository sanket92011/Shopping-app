import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/product_card.dart';

import '../models/products_model.dart';
import 'products_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _CollectionState();
}

class _CollectionState extends State<ProductList> {
  static const border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(50),
    ),
  );
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
    return SafeArea(
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
                      setState(
                        () {
                          selectedChip = filter;
                        },
                      );
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 1080) {
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.75),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                            onClick: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return ProductsDetailsPage(
                                        product: product);
                                  },
                                ),
                              );
                            },
                            productName: product['title'] as String,
                            productPrice: product['price'].toString(),
                            productImage: product['imageUrl'] as String);
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                            onClick: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return ProductsDetailsPage(
                                        product: product);
                                  },
                                ),
                              );
                            },
                            productName: product['title'] as String,
                            productPrice: product['price'].toString(),
                            productImage: product['imageUrl'] as String);
                      },
                      itemCount: products.length,
                    );
                  }
                },
              ),
            ),
          if (selectedChip == filters[1])
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final addidasShoes = products[index];
                  return addidasShoes['company'] == 'Addidas'
                      ? ProductCard(
                          onClick: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) {
                                  return ProductsDetailsPage(
                                      product: addidasShoes);
                                },
                              ),
                            );
                          },
                          productName: addidasShoes['title'] as String,
                          productPrice: addidasShoes['price'].toString(),
                          productImage: addidasShoes['imageUrl'] as String)
                      : const SizedBox();
                },
                itemCount: products.length,
              ),
            ),
          if (selectedChip == filters[2])
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final nikeShoes = products[index];
                  return nikeShoes['company'] == 'Nike'
                      ? ProductCard(
                          productName: nikeShoes['title'].toString(),
                          productPrice: nikeShoes['price'].toString(),
                          productImage: nikeShoes['imageUrl'].toString(),
                          onClick: () {
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context) {
                                return ProductsDetailsPage(product: nikeShoes);
                              },
                            ));
                          })
                      : const SizedBox();
                },
                itemCount: products.length,
              ),
            ),
          if (selectedChip == filters[3])
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final bataShoes = products[index];
                  return bataShoes['company'] == 'Bata'
                      ? ProductCard(
                          productName: bataShoes['title'].toString(),
                          productPrice: bataShoes['price'].toString(),
                          productImage: bataShoes['imageUrl'].toString(),
                          onClick: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) {
                                  return ProductsDetailsPage(
                                      product: bataShoes);
                                },
                              ),
                            );
                          },
                        )
                      : const SizedBox();
                },
                itemCount: products.length,
              ),
            ),
        ],
      ),
    );
  }
}
