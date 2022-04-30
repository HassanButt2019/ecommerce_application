

import 'package:fluttertask/main.dart';

class ConstantPath
{
  static const String assetpath = 'assets/';
  static const String baseUrl = "https://ecom.spidertech.dev/api/";

  static const Map<String , String>? userHeader = {"Content-type": "application/json", "Accept": "application/json"};


  static Future<Map<String,String>>? getAuthUserHeader()async{
    String? value = await storage.read(key: 'userToken');


    Map<String , String>? authUserHeader = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${value!}"
    };

    return authUserHeader;

  }


  static String getPath(String path) {
    return assetpath+path;
  }
  static String getBaseUrl(String path) {
    return baseUrl+path;
  }


}