import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/navigation/routes.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ContinueButton(
        onPressed: () {
          Get.toNamed(Routes.signInRoute);
        },
        text: "Continue",
      )),
    );
  }
}
