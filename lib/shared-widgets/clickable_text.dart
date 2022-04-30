




import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({Key? key ,required this.ontap  ,this.label , this.color = Colors.white}) : super(key: key);

  final void Function()? ontap;
  final String? label;
  final Color? color ;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: label,
          recognizer: TapGestureRecognizer()
            ..onTap = ontap,
          style:  TextStyle(
            fontSize: 18,
            color: color!,
          )
      ),
    );
  }
}
