import 'package:flutter/material.dart';
import 'package:tracing_time/constants/mycolors.dart';
import 'package:tracing_time/main.dart';
import 'package:tracing_time/presentation/widgets/custom_elevated_button.dart';
import 'package:tracing_time/presentation/widgets/custom_text.dart';

class CustomUploadDialog extends StatelessWidget {
  final void Function()? onPressed;
  const CustomUploadDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      child: Container(
        width: 575.0,
        height: 312.0,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Title
            Row(
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: AppColor.darkGrey,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(
                    Icons.file_upload_outlined,
                    size: 18,
                    color: (myBox!.get("isDark") ?? false)
                        ? AppColor.black
                        : theme.iconTheme.color,
                  ),
                ),
                const SizedBox(width: 8),
                CustomText(
                  title: "Adding Attachment",
                  textStyle: theme.textTheme.headlineMedium!.copyWith(
                    color: (myBox!.get("isDark") ?? false)
                        ? AppColor.grey02
                        : Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Expanded(
              child: SizedBox(
                width: 575.0,
                height: 312.0,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 50.0,
                      color: AppColor.grey,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      title: "Drag & Drop files here",
                      textStyle: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 20.0,
                        color: (myBox!.get("isDark") ?? false)
                            ? AppColor.grey02
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      title: "Or",
                      textStyle: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 20.0,
                        color: (myBox!.get("isDark") ?? false)
                            ? AppColor.grey02
                            : Colors.black,
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
                  title: "Discard",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: null,
                  backgroundColor: AppColor.lightGrey,
                  radius: 8.0,
                  textStyle: theme.textTheme.headlineMedium,
                ),

                CustomElevatedbutton(
                  title: "Browse Files",
                  onPressed: onPressed,
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
