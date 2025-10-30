import 'package:flutter/material.dart';
import 'package:tracing_time/constants/mycolors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController descriptionController;
  final String? Function(String?)? validator;
  final String hintText;
  final ThemeData theme;
  const CustomTextFormField({
    super.key,
    required this.descriptionController,
    required this.validator,
    required this.hintText,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
      child: TextFormField(
        validator: validator,
        controller: descriptionController,
        maxLength: 500,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.headlineSmall!.copyWith(fontSize: 12.0),
          filled: true,
          fillColor: AppColor.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
