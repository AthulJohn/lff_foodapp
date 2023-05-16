import 'package:flutter/material.dart';

import '../../constants/appColors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key, this.onChanged, this.hintText, this.align = TextAlign.start});
  final void Function(String)? onChanged;
  final String? hintText;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlign: align,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.secondaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 2)),
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.borderColor)),
    );
  }
}
