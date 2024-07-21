class CategoryModel{
  String? id;
  String? name;
  CategoryModel({required this.name,required this.id});
  factory CategoryModel.fromJson(Map<String,dynamic>json){
    return CategoryModel(name: json['name'], id: json['id']);
  }
}