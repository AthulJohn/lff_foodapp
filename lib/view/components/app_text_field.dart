import 'package:flutter/material.dart';

import '../../constants/appColors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, this.onChanged, this.hintText});
  final void Function(String)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
