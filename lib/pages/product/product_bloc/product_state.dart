part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitialState extends ProductState {}
final class ProductLoadingState extends ProductState {}
final class ProductLoadedState extends ProductState {
  DataModel productdtas;
  ProductLoadedState({required this.productdtas});
}
final class ProductErrorState extends ProductState {
  String Errormsg;
  ProductErrorState({required this.Errormsg});
}
