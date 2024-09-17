import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'beuity.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories = [
    "beauty",
    "fragrances",
    "furniture",
    "groceries",
    "home-decoration",
    "kitchen-accessories",
    "laptops",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "mobile-accessories",
    "motorcycle",
    "skin-care",
    "smartphones",
    "sports-accessories",
    "sunglasses",
    "tablets",
    "tops",
    "vehicle",
    "womens-bags",
    "womens-dresses",
    "womens-jewellery",
    "womens-shoes",
    "womens-watches"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            leading: Icon(Icons.panorama_rounded),
            onTap: () {
              // Navigate to the category screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsApi(beauty: categories[0]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  CategoryScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('Welcome to the $categoryName category!'),
      ),
    );
  }
}
