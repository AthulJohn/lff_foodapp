import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lff_foodapp/constants/appColors.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton(
      {super.key,
      required this.onPressed,
      this.text,
      this.icon,
      this.fontSize = 17,
      this.padding = 30});
  final Function()? onPressed;
  final String? text;
  final IconData? icon;
  final double fontSize, padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (text != null)
              Text(
                text!,
                style: TextStyle(fontFamily: "Sunflower"),
              ),
            if (icon != null) Icon(icon!)
          ],
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: padding, vertical: (2 / 3) * padding),
            textStyle: TextStyle(fontSize: fontSize),
            shape: const StadiumBorder()));
  }
}

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton(
      {super.key,
      required this.onPressed,
      this.text,
      this.icon,
      this.fontSize = 17});
  final Function()? onPressed;
  final String? text;
  final IconData? icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (text != null)
              Text(
                text!,
                style: TextStyle(fontFamily: "Sunflower"),
              ),
            if (icon != null) Icon(icon!)
          ],
        ),
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: TextStyle(fontSize: fontSize),
            side: const BorderSide(color: AppColors.primaryColor, width: 2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )));
  }
}
