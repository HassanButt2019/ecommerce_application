


import 'package:fluttertask/categories/model/categories.dart';
import 'package:fluttertask/categories/repository/category_repository.dart';

class HomeRepository
{
  Future<List<Categories>> getAllCategories() async {
    return CategoryRepository().getAllCategories();
  }
}

