

import 'package:flutter/material.dart';

class GeneralFunctions
{
  static navigateTo(BuildContext context, Route route) {
   // Navigator.of(context).pop();

    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(context, route);
    });
  }
}