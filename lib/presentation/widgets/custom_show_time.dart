import 'package:flutter/material.dart';
import 'package:tracing_time/constants/mycolors.dart';
import 'package:tracing_time/presentation/widgets/custom_text.dart';

class CustomShowTime extends StatelessWidget {
  final String startDateTime;
  final ThemeData theme;
  const CustomShowTime({
    super.key,
    required this.startDateTime,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 7.0, bottom: 15.0),
          height: 36.0,
          width: 85.0,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(6.4),
          ),
          child: CustomText(
            title: startDateTime == "" ? " " : startDateTime.substring(0, 5),
            textStyle: theme.textTheme.headlineSmall!.copyWith(fontSize: 12.0),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 7.0, bottom: 15.0),
          height: 36.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(6.4),
          ),
          child: CustomText(
            title: startDateTime == "" ? "" : startDateTime.substring(5),
            textStyle: theme.textTheme.headlineSmall!.copyWith(fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}
