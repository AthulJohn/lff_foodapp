import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/app_dropdown.dart';
import 'package:lff_foodapp/view/components/app_text_field.dart';

class TimeField extends StatelessWidget {
  TimeField({super.key, required this.onChanged});
  TimeOfDay time = TimeOfDay(hour: 21, minute: 0);
  bool isAfternoon = true;
  void Function(TimeOfDay) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            hintText: "HH",
            onChanged: (val) {
              int? value = int.tryParse(val);
              if (value == null) return;
              if (value < 0 || value > 12) return;

              int adder = isAfternoon ? 12 : 0;
              time = time.replacing(hour: (value % 12) + adder);

              onChanged.call(time);
            },
          ),
        ),
        const Text(
          ' : ',
          style: TextStyle(fontSize: 40),
        ),
        Expanded(
          child: AppTextField(
            hintText: "MM",
            onChanged: (val) {
              int? value = int.tryParse(val);
              if (value == null) return;
              if (value < 0 || value > 60) return;

              time = time.replacing(minute: value % 60);

              onChanged.call(time);
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(child: TimeSection(
          onChanged: (isAfternoon) {
            int adder = isAfternoon ? 12 : 0;
            time = time.replacing(hour: (time.hour % 12) + adder);
            onChanged.call(time);
          },
        )),
      ],
    );
  }
}

class TimeSection extends StatefulWidget {
  const TimeSection({super.key, required this.onChanged});
  final void Function(bool) onChanged;

  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  bool isAfternoon = true;
  @override
  Widget build(BuildContext context) {
    return AppDropDown(
      items: const ["AM", "PM"],
      value: isAfternoon ? "PM" : "AM",
      onChanged: (val) {
        setState(() {
          isAfternoon = val == "PM";
        });

        widget.onChanged.call(isAfternoon);
      },
    );
  }
}
