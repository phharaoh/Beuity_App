import 'dart:convert';
import 'dart:developer';
import 'about app.dart';
import 'RegisterScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pro1/models/products_model.dart';
import 'package:pro1/Api_provider/api_provider.dart';

class ProductsApi extends StatefulWidget {
  ProductsApi({super.key, required String beauty});

  @override
  _ProductsApiState createState() => _ProductsApiState();
}

class _ProductsApiState extends State<ProductsApi> {
  Products? productsModel;
  bool isLoading = true;

  int selectedIndix = 0;

  @override
  void initState() {
    super.initState();
    getProductsFromApiProvider();
  }

  getProductsFromApiProvider() async {
    productsModel = await ApiProvider().getproducts();
    setState(() {
      isLoading = false;
    });
    log(productsModel!.products![0].title.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "beauty",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutApp()),
                );
              },
              icon: const Icon(Icons.accessibility)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DevTeam()),
                );
              },
              icon: const Icon(Icons.people)),
        ],
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productsModel!.products!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  productsModel!.products![index].thumbnail!)),
                          title: Text(productsModel!.products![index].title!
                              .toString()),
                          subtitle: Text(productsModel!
                              .products![index].category!
                              .toString()));
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            selectedIndix = val;
          });
        },
        currentIndex: selectedIndix,
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
    );
  }
}
