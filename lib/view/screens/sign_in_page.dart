import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';

import '../../constants/appColors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Graphics.png"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Let's get",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "STARTED",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter your phone number"),
                    SizedBox(
                      height: 10,
                    ),
                    //TODO: Add PhoneTextField here
                    PhoneField()
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ContinueButton(
                  onPressed: () {},
                  text: "Sent OTP",
                  icon: Icons.arrow_forward,
                ),
              ),
            ),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    ));
  }
}
