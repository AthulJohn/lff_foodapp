import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:lff_foodapp/view/components/role_card.dart';

import '../../constants/appColors.dart';
import '../components/title_text.dart';

class RoleSelectPage extends StatelessWidget {
  const RoleSelectPage({super.key});

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
              flex: 1,
              child: TitleText(
                blackText: "Let's get",
                greenText: "STARTED",
                size: 40,
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("I am a..."),
                    const RoleCard(
                      isCustomer: true,
                      isSelected: true,
                    ),
                    const RoleCard(
                      isCustomer: false,
                      isSelected: true,
                    ),
                    Center(
                      child: ContinueButton(
                        onPressed: () {},
                        text: "Continue",
                        icon: Icons.arrow_forward,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    ));
  }
}
