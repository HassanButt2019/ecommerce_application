

class Products
{

  final String? name;
  final String? price;
  final String? quantity;
  final String? image;
  final String? categoryId;


  String? updatedAt;
  String? createdAt;
  String? id;

  Products({this.name, this.id, this.updatedAt, this.createdAt,this.image,this.price,this.categoryId,this.quantity});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json['id'].toString(),
    name: json['name'] as String?,
      price:json['price'] as String? ,
       quantity:json['quantity'].toString(),
      image: json['image'].toString(),
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      categoryId: json['id'].toString(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
  };

  Map<String, dynamic> toJsonUpdate() => {
    'name': name,
    'id':id
  };
}