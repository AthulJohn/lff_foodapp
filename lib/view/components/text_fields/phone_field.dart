import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:lff_foodapp/constants/appColors.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, this.onChanged});
  final void Function(PhoneNumber)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: IntlPhoneField(
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                filled: true,
                prefixIconColor: AppColors.primaryColor,
                fillColor: AppColors.secondaryColor,
                focusColor: AppColors.primaryColor,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
              ),
              cursorColor: AppColors.primaryColor,
              initialCountryCode: 'IN',
              disableLengthCheck: true,
              onChanged: onChanged,
            )
            // child: DropdownButton<String>(
            //   items: [
            //     DropdownMenuItem(child: Text("+91"), value: "+91"),
            //   ],
            //   onChanged: (value) {
            //     print(value);
            //   },
            // ),
            )
      ],
    );
  }
}
