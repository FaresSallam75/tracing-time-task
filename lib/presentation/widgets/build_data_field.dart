import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracing_time/constants/mycolors.dart';
import 'package:tracing_time/presentation/widgets/custom_text.dart';

class BuildDateField extends StatefulWidget {
  final bool isStart;
  final ThemeData theme;
  const BuildDateField({super.key, required this.isStart, required this.theme});

  @override
  State<BuildDateField> createState() => _BuildDateFieldState();
}

class _BuildDateFieldState extends State<BuildDateField> {
  DateTime? startDate;
  DateTime? endDate;
  String? startDateTime;
  String? endDateTime;

  @override
  Widget build(BuildContext context) {
    final date = widget.isStart ? startDate : endDate;
    final title = widget.isStart ? "Start Date" : "End Date";
    final formattedDate = date != null
        ? DateFormat('yyyy-MM-dd').format(date)
        : "Choose Date";

    return FormField<DateTime>(
      validator: (value) {
        if ((widget.isStart && startDate == null) ||
            (!widget.isStart && endDate == null)) {
          return 'Please choose a date';
        }
        return null;
      },
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: title,
            textStyle: widget.theme.textTheme.headlineMedium!.copyWith(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              await pickDate(context, widget.isStart);
              field.didChange(widget.isStart ? startDate : endDate);
            },
            child: Container(
              height: 36.0,
              width: 310.0,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: field.hasError ? Colors.red : Colors.transparent,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: formattedDate,
                    textStyle: widget.theme.textTheme.headlineSmall,
                  ),
                  const Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          if (field.hasError)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                field.errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> pickDate(BuildContext context, bool isStart) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      final dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time?.hour ?? 0,
        time?.minute ?? 0,
      );

      setState(() {
        if (isStart) {
          startDate = dateTime;
          startDateTime =
              "${time!.hourOfPeriod.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? "AM" : "PM"}";
        } else {
          endDate = dateTime;
          endDateTime =
              "${time!.hourOfPeriod.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? "AM" : "PM"}";
        }
      });
    }
  }
}
