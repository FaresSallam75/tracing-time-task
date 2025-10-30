import 'package:flutter/material.dart';
import 'package:tracing_time/constants/mycolors.dart';
import 'package:tracing_time/main.dart';
import 'package:tracing_time/presentation/widgets/custom_text.dart';

class CustomSuccessDialog extends StatefulWidget {
  const CustomSuccessDialog({super.key});

  @override
  State<CustomSuccessDialog> createState() => _CustomSuccessDialogState();
}

class _CustomSuccessDialogState extends State<CustomSuccessDialog> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(const Duration(seconds: 2), () {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // backgroundColor: isDark ? Colors.grey[900] : Colors.white,
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
                      Icons.check_circle_rounded,
                      size: 50.0,
                      color: AppColor.green,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      title: "Successful",
                      textStyle: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 20.0,
                        color: (myBox!.get("isDark") ?? false)
                            ? AppColor.grey02
                            : AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      title: "Your Request Has Been Successfully Submitted",
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
          ],
        ),
      ),
    );
  }
}
