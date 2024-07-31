

import 'package:cloudbazar/pages/order/order_bloc/orderstatus.dart';

class OrderData{
  bool? status;
  String? message;
  List<Order>? orders;
  OrderData({required this.status,required this.message, required this.orders});

  factory OrderData.fromJson(Map<String,dynamic> json){
    List<Order> orderslist = [];
    for(Map<String,dynamic> each in json['orders']){
      orderslist.add(Order.fromJson(each));
    }

    return OrderData(
        status: json['status'],
        message: json['message'],
        orders: orderslist,
    );
  }


}

class Order {
  final int id;
  final List<ProductData> product;
  final String created_at;
  final String orderNumber;
  final OrderStatus status;
  final String total_amount;

  Order({
    required this.id,
    required this.product,
    required this.created_at,
    required this.orderNumber,
    required this.status,
    required this.total_amount,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var productList = (json['product'] as List)
        .map((item) => ProductData.fromJson(item))
        .toList();
    return Order(
      id: json['id'],
      product: productList,
      created_at: json['created_at'],
      orderNumber: json['order_number'],
      status: OrderStatus.fromInt(int.parse(json['status']),),
      total_amount: json['total_amount'],
    );
  }
}



class ProductData{
  num? id;
  String? image;
  String? name;
  String? price;
  num? quantity;
  ProductData({required this.id, required this.image, required this.name, required this.price, required this.quantity});
  factory ProductData.fromJson(Map<String,dynamic> json){
    return ProductData(
    id: json['id'],
    image: json['image'],
  name: json['name'],
  price:json['price'],
  quantity: json['quantity']
  );
  }
}
