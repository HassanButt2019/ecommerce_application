


import 'dart:convert';

import 'package:fluttertask/constants/constant_paths.dart';
import 'package:fluttertask/product/model/products.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Products>> getAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse(ConstantPath.getBaseUrl('products')),
        headers: await ConstantPath.getAuthUserHeader(),
      );
      final json = jsonDecode(response.body);
      List<Products> products = json['data']
          .map<Products>((model) => Products.fromJson(model))
          .toList();
      return products;
    } catch (e) {
    }
    return [];
  }

  Future<Products> getProductById(int id) async {
    try {
      final response = await http.get(
        Uri.parse(ConstantPath.getBaseUrl('productById/$id')),
        headers: await ConstantPath.getAuthUserHeader(),
      );
      final json = jsonDecode(response.body);
      Products category = Products.fromJson(json['data']);
      return category;
    } catch (e) {
    }
    return Products();
  }
  Future<Products> getProductByName(String name) async {
    try {
      final response = await http.get(
        Uri.parse(ConstantPath.getBaseUrl('productByName/$name')),
        headers: await ConstantPath.getAuthUserHeader(),
      );
      final json = jsonDecode(response.body);
      Products category = Products.fromJson(json['data']);
      return category;
    } catch (e) {
    }
    return Products();
  }

  Future<List<Products>> getProductByCategory(int id) async {
    try {
      final response = await http.get(
        Uri.parse(ConstantPath.getBaseUrl('productByCategory/$id')),
        headers: await ConstantPath.getAuthUserHeader(),
      );
      final json = jsonDecode(response.body);
      List<Products> products = json['data']
          .map<Products>((model) => Products.fromJson(model))
          .toList();
      return products;
    } catch (e) {
    }
    return [];
  }
  //
  //
  // Future<Categories> addCategory(String name) async {
  //   try {
  //     final response = await http.post(
  //         Uri.parse(ConstantPath.getBaseUrl('category-store')),
  //         headers: await ConstantPath.getAuthUserHeader(),
  //         body: jsonEncode(
  //             <String, String>{
  //               "name":name
  //             })
  //     );
  //     final json = jsonDecode(response.body);
  //     print(json);
  //     Categories category = Categories.fromJson(json['data']);
  //     print(category);
  //     return category;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return Categories();
  // }
  //
  //
  // Future<Categories> updateCategory(String name , int id) async {
  //   try {
  //     final response = await http.post(
  //         Uri.parse(ConstantPath.getBaseUrl('category-update')),
  //         headers: await ConstantPath.getAuthUserHeader(),
  //         body: jsonEncode(
  //             <String, dynamic>{
  //               "name":name,
  //               "id":id
  //             })
  //     );
  //     final json = jsonDecode(response.body);
  //     print(json);
  //     Categories category = Categories.fromJson(json['data']);
  //     print(category);
  //     return category;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return Categories();
  // }
  //


}

