import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Api_provider/api_provider.dart';
import '../models/products_model.dart';
part 'products_dart_state.dart';

class ProductsDartCubit extends Cubit<ProductsDartState> {
  ProductsDartCubit() : super(ProductsDartInitial()){
    getProductsFromCubit();
  }
  Products? productmodel;

  getProductsFromCubit() async{
    try {
      emit(ProductsDartLoading());
      productmodel =await ApiProvider().getproducts();
      emit(ProductsDartSuccess(productmodel!));
    } catch (e) {
      print(e.toString());
      emit(productsError(e.toString()));
    }
  }
}
