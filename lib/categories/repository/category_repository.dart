import 'dart:convert';
import 'package:fluttertask/categories/model/categories.dart';
import 'package:fluttertask/constants/constant_paths.dart';
import 'package:fluttertask/product/model/products.dart';
import 'package:fluttertask/product/repository/product_repository.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {

  Future<List<Categories>> getAllCategories() async {
    try {
      final response = await http.get(
        Uri.parse(ConstantPath.getBaseUrl('allcategory')),
        headers: await ConstantPath.getAuthUserHeader(),
      );
      final json = jsonDecode(response.body);
      List<Categories> categories = json['data']
          .map<Categories>((model) => Categories.fromJson(model))
          .toList();
      return categories;
    } catch (e) {
    }
    return [];
  }


  Future<List<Products>> getProductByCategory(int id) async {

    return ProductRepository().getProductByCategory(id);
  }






  Future<Categories> getCategoryById(int id) async {
    try {
      final response = await http.get(
        Uri.parse(ConstantPath.getBaseUrl('show-category/${id}')),
        headers: await ConstantPath.getAuthUserHeader(),
      );
      final json = jsonDecode(response.body);
      Categories category = Categories.fromJson(json['data']);
      return category;
    } catch (e) {
    }
    return Categories();
  }


  Future<Categories> addCategory(String name) async {
    try {
      final response = await http.post(
        Uri.parse(ConstantPath.getBaseUrl('category-store')),
        headers: await ConstantPath.getAuthUserHeader(),
          body: jsonEncode(
              <String, String>{
                "name":name
              })
      );
      final json = jsonDecode(response.body);
      Categories category = Categories.fromJson(json['data']);
      return category;
    } catch (e) {
    }
    return Categories();
  }


  Future<Categories> updateCategory(String name , int id) async {
    try {
      final response = await http.post(
          Uri.parse(ConstantPath.getBaseUrl('category-update')),
          headers: await ConstantPath.getAuthUserHeader(),
          body: jsonEncode(
              <String, dynamic>{
                "name":name,
                "id":id
              })
      );
      final json = jsonDecode(response.body);
      Categories category = Categories.fromJson(json['data']);
      return category;
    } catch (e) {
    }
    return Categories();
  }



}
