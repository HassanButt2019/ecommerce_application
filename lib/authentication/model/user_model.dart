part of 'model.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? token;

  UserModel({this.name, this.email, this.password , this.token});

  factory UserModel.fromSignUpJson(Map<String,dynamic> json)
  => UserModel(
    name: json['name'] as String?,
    token: json['token'] as String?,
  );

  factory UserModel.fromSignInJson(Map<String,dynamic> json)
  => UserModel(
    token: json['token'] as String?,
  );


  Map<String, dynamic> toSignUpJson() =>{
    'name': name,
    'email': email,
     'password':password
  };

  Map<String, dynamic> toSignInJson() =>{
    'email': email,
    'password':password
  };





}
