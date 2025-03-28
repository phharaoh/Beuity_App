import 'api_Provider.dart';
import 'dart:developer' show log;
import '../widget/about app.dart';
import 'package:flutter/material.dart';
import 'package:pro1/SmartPhoneApi/api_model.dart';

class SmartPhoneApi extends StatefulWidget {
  const SmartPhoneApi({super.key});

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
    log(productsModel!.products![0].title.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutApp()),
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
