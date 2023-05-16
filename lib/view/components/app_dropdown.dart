import 'package:flutter/material.dart';
import 'package:lff_foodapp/constants/appColors.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown(
      {super.key, required this.items, required this.value, this.onChanged});
  final List<String> items;
  final String value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor,
          border: Border.all(color: AppColors.borderColor, width: 1)),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButton<String>(
        onChanged: onChanged,
        value: value,
        isExpanded: true,
        underline: Container(),
        items: [
          for (String item in items)
            DropdownMenuItem(
              value: item,
              child: Text(item),
            ),
        ],
      ),
    );
  }
}
