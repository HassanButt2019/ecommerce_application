import 'dart:convert';

import 'package:fluttertask/constants/constant_paths.dart';
import 'package:fluttertask/main.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertask/authentication/model/model.dart';

class UserRepository {


  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await http.post(
          Uri.parse(ConstantPath.getBaseUrl('login')),
          headers: ConstantPath.userHeader,
          body: jsonEncode(
              <String, String>{'email': email, 'password': password}));
      UserModel user =
          UserModel.fromSignInJson(jsonDecode(response.body)['success']);

      await storage.write(key: 'userToken', value: user.token);
      await storage.write(key: 'isLogin', value: user.token==null?false.toString():true.toString());

      return user;
    } catch (e) {
    }
    return UserModel();
  }

  Future<UserModel> signUpWithEmailAndPassword({String? name,
      String? email, String? password}) async {
    var body = jsonEncode(
        <String, String>{
          'name':name!.toString(),
          'email': email!.toString(),
          'password': password!.toString(),

        });
    try {
      final response = await http.post(
          Uri.parse(ConstantPath.getBaseUrl('register')),
          headers: ConstantPath.userHeader,
          body: body

      );
      UserModel user =
      UserModel.fromSignUpJson(jsonDecode(response.body)['success']);
      return user;
    } catch (e) {
    }
    return UserModel();
  }



}
