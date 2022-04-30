
import 'package:flutter/material.dart';

import 'introduction_screens/view/view.dart';


class EcomApp extends StatelessWidget {
  const EcomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


