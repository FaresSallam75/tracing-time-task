import 'package:flutter/material.dart';
import 'package:tracing_time/presentation/widgets/custom_text.dart';

class CustomElevatedbutton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Widget? icon;
  final Color? backgroundColor;
  final double radius;
  final TextStyle? textStyle;
  const CustomElevatedbutton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.radius,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.0,
      width: 135.0,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon:
            icon, //const Icon(Icons.file_upload_outlined, color: AppColor.black),
        label: CustomText(
          title: title, //"Upload",
          textStyle: textStyle,
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(radius),
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        ),
      ),
    );
  }
}
