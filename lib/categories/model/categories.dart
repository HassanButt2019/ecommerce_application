class Categories {
  final String? name;
  String? updatedAt;
  String? createdAt;
  String? id;

  Categories({this.name, this.id, this.updatedAt, this.createdAt});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
      name: json['name'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'].toString());

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  Map<String, dynamic> toJsonUpdate() => {
    'name': name,
    'id':id
  };

}
