import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';

import '../../constants/appColors.dart';
import '../components/title_text.dart';

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
            const Expanded(
              flex: 2,
              child: TitleText(
                blackText: "Let's get",
                greenText: "STARTED",
                size: 40,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Enter your phone number"),
                    SizedBox(
                      height: 10,
                    ),
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
            const Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    ));
  }
}
