import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/app_dropdown.dart';
import 'package:lff_foodapp/view/components/app_text_field.dart';

class TimeField extends StatelessWidget {
  const TimeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: AppTextField(),
        ),
        const Text(
          ' : ',
          style: TextStyle(fontSize: 40),
        ),
        const Expanded(
          child: AppTextField(),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: AppDropDown(
            items: const ["AM", "PM"],
            value: "PM",
            onChanged: (val) {},
          ),
        ),
      ],
    );
  }
}
