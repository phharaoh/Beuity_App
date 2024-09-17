import 'package:dio/dio.dart';

import 'api_model.dart';
// import '../models/products_model.dart';

class ApiProvider {


  Category? productModel;

  getproducts() async {
    Response productResopnse = await Dio().get("https://dummyjson.com/products/category/smartphones",
      queryParameters: {
        "select": "title,category,price,thumbnail"
      },
    );
    productModel = Category.fromJson(productResopnse.data);
    print(productModel!.products![0].title);
    return productModel;
  }
}
