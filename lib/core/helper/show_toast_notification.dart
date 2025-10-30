import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:tracing_time/constants/mycolors.dart';

abstract class ShowToastMessage {
  static void showErrorToastMessage(
    BuildContext context, {
    required String message,
  }) {
    toastification.show(
      alignment: Alignment.bottomCenter,
      context: context,
      backgroundColor: Colors.red,
      type: const ToastificationType.custom(
        "error",
        AppColor.white,
        Icons.close,
      ),
      title: Text(message, style: const TextStyle(color: AppColor.white)),
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  static void showSucessToastMessage(
    BuildContext context, {
    required String message,
  }) {
    toastification.show(
      context: context,
      type: const ToastificationType.custom(
        "success",
        AppColor.white,
        Icons.check,
      ),
      backgroundColor: AppColor.green,
      title: Text(message, style: const TextStyle(color: AppColor.white)),
      autoCloseDuration: const Duration(seconds: 4),
    );
  }
}
