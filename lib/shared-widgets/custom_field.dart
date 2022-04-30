


import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key , this.controller , this.labelText , this.validator}) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Container(
      color: Colors.blueGrey.shade700,
      width: width*0.85,
      height: height*0.1,
      child: TextFormField(
        validator: validator,
        controller: controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            border: InputBorder.none,
            labelText: labelText ??" ",
            labelStyle:const TextStyle(
              color: Colors.white,
            ),
            hintStyle: const TextStyle(
              color: Colors.white,
            )
        ),
      ),
    );
  }
}
