


import 'package:flutter/material.dart';
import 'package:fluttertask/constants/constant_colors.dart';
import 'package:fluttertask/constants/constant_paths.dart';

class NoResult extends StatelessWidget {
  const NoResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: height*0.30,
              width: width*0.40,
              child: Image.asset(ConstantPath.getPath('No results.png')),
            ),
          )
        ],
      ),

    );
  }

}
