part of 'products_dart_cubit.dart';

@immutable
sealed class ProductsDartState {}

final class ProductsDartInitial extends ProductsDartState {}
final class ProductsDartLoading extends ProductsDartState {}
final class ProductsDartSuccess extends ProductsDartState {
  Products productsmodel;
  ProductsDartSuccess(this.productsmodel);
}


final class productsError extends ProductsDartState {
  String errorMessage;
  productsError(this.errorMessage);

}