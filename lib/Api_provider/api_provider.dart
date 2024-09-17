import 'package:dio/dio.dart';
import '../models/products_model.dart';

class ApiProvider {
  Products? productsmodel;

  getproducts() async {
    Response productResopnse = await Dio().get("https://dummyjson.com/products",
      queryParameters: {
        "select": "id,title,description,category,price,thumbnail"
      },
    );
    productsmodel = Products.fromJson(productResopnse.data);
    print(productsmodel!.products![0].title);
    return productsmodel;
  }
  //
  // userLogin({required username, required password}) async {
  //   FormData formData = FormData.fromMap(
  //     {"username": username, "password": password},
  //   );
  //
  //   Response response =
  //       await Dio().post("https://dummyjson.com/auth/login", data: formData);
  //   print(response.data);
  // }
}
