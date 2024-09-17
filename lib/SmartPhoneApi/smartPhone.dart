import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import '../models/products_model.dart';
// import 'package:pro1/models/products_model.dart';
// import 'package:pro1/Api_provider/api_provider.dart';
// import 'DeveloperTeam.dart';
// import 'RegisterScreen.dart';
// import 'about app.dart';
import '../DeveloperTeam.dart';
import '../about app.dart';
import 'api_Provider.dart';
import 'api_model.dart';

class SmartPhoneApi extends StatefulWidget {
  SmartPhoneApi({super.key});

  @override
  _SmartPhoneApiState createState() => _SmartPhoneApiState();
}

class _SmartPhoneApiState extends State<SmartPhoneApi> {
  Category? productsModel;
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
    print(productsModel!.products![0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => aboutApp()),
                );
              },
              icon: Icon(Icons.accessibility)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DevTeam()),
                );
              },
              icon: Icon(Icons.people)),
        ],
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
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
        items: [
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
