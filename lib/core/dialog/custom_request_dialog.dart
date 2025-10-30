import 'package:flutter/material.dart';
import 'package:tracing_time/constants/mycolors.dart';
import 'package:tracing_time/main.dart';
import 'package:tracing_time/presentation/widgets/custom_elevated_button.dart';
import 'package:tracing_time/presentation/widgets/custom_text.dart';

class CustomRequestDialog extends StatelessWidget {
  final void Function()? onPressedNo;
  final void Function()? onPressedYes;
  const CustomRequestDialog({
    super.key,
    required this.onPressedNo,
    required this.onPressedYes,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 400.0,
        height: 312.0,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: 411.0,
                height: 230.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.note_alt_rounded,
                      size: 50.0,
                      color: AppColor.grey,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      title: "Creating Request",
                      textStyle: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 20.0,
                        color: (myBox!.get("isDark") ?? false)
                            ? AppColor.grey02
                            : AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      title: "Are You Sure You Want To Create This Request ?",
                      textStyle: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 14.0,
                        color: (myBox!.get("isDark") ?? false)
                            ? AppColor.grey02
                            : AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Discard Button
                CustomElevatedbutton(
                  title: "No",
                  onPressed: onPressedNo,
                  icon: null,
                  backgroundColor: Color.fromRGBO(217, 217, 217, 1.0),
                  radius: 4.0,
                  textStyle: theme.textTheme.headlineMedium,
                ),

                CustomElevatedbutton(
                  title: "Yes",
                  onPressed: onPressedYes,
                  icon: null,
                  backgroundColor: AppColor.grey02,
                  radius: 8.0,
                  textStyle: theme.textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
