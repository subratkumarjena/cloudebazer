
class DataModel {
  String? message;
  bool? status;
  List<ProductModel>?data;

  DataModel({
    required this.message, required this.status, required this.data});

  factory DataModel.fromJson(Map<String, dynamic>json){
    List<ProductModel>mData=[];
    for(Map<String, dynamic> each in json['data']){
      mData.add(ProductModel.fromJson(each));
    }
    return DataModel(
        message: json['message'], status: json['status'], data: mData);
  }
}
class ProductModel {
  String? id;
  String? category_id;
  String? created_at;
  String? image;
  String? name;
  String? price;
  String? status;
  String? updated_at;

  ProductModel({
    required this.id, required this.category_id, required this.created_at, required this.image,
    required this.name, required this.price, required this.status, required this.updated_at});

  factory ProductModel.fromJson(Map<String, dynamic>json){
    return ProductModel(
        id: json['id'],
        category_id: json['category_id'],
        created_at: json['created_at'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        status: json['status'],
        updated_at: json['updated_at']);
  }
}

