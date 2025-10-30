import 'package:flutter/material.dart';
import 'package:tracing_time/constants/mycolors.dart';
import 'package:tracing_time/presentation/widgets/custom_text.dart';

class CustomDropDownButton extends StatelessWidget {
  final String selectedType;
  final ThemeData theme;
  final List<String> requestTypes;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomDropDownButton({
    super.key,
    required this.selectedType,
    required this.theme,
    required this.requestTypes,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: selectedType.isNotEmpty ? selectedType : null,
      validator: validator,
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: AppColor.white,
            height: 40.0,
            width: 310.0,
            child: DropdownButtonFormField<String>(
              initialValue: field.value,
              padding: const EdgeInsets.only(right: 16.0, left: 8.0),
              dropdownColor: AppColor.white01,
              style: theme.textTheme.headlineSmall,
              items: requestTypes
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: CustomText(
                        title: type,
                        textStyle: theme.textTheme.headlineSmall!.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                field.didChange(value);
                onChanged?.call(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          if (field.hasError)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 4.0),
              child: CustomText(
                title: field.errorText!,
                textStyle: theme.textTheme.headlineSmall!.copyWith(
                  color: Colors.red[700],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
