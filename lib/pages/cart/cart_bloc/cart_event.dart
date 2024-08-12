part of 'cart_bloc.dart';

abstract class ViewCartEvents {}
class ViewCartEvent extends ViewCartEvents {}
class nAddToCartEvent extends ViewCartEvents{
  int productId;
  int qty;
  nAddToCartEvent({required this.productId, required this.qty});
}
