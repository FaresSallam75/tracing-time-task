import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  EdgeInsetsGeometry? padding;
  final String title;
  TextStyle? textStyle;
  TextAlign? textAlign;

  CustomText({
    super.key,
    required this.title,
    this.padding,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(textAlign: textAlign, title, style: textStyle),
    );
  }
}
