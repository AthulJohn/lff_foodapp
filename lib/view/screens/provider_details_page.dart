import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:lff_foodapp/view/components/role_card.dart';
import 'package:lff_foodapp/view/components/type_card.dart';

import '../../constants/appColors.dart';
import '../components/app_text_field.dart';
import '../components/title_text.dart';

class ProviderDetailsPage extends StatelessWidget {
  const ProviderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Graphics.png"),
              opacity: 0.24,
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const TitleText(
              blackText: "Thank you for being a",
              greenText: "PROVIDER",
              size: 28,
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: const TextSpan(
              children: [
                TextSpan(text: "Let's get you "),
                TextSpan(
                    text: "READY",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor)),
              ],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Enter your organization name"),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {},
                  hintText: "Tasty Restaurant",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Select your organization type"),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: const [
                      Expanded(
                        child: TypeCard(
                          isHorizontal: false,
                          isSelected: true,
                          image: 'Restaurant.png',
                          title: 'Restaurant',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TypeCard(
                          isHorizontal: false,
                          isSelected: false,
                          image: 'Catering.png',
                          title: 'Catering',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 60,
                  child: TypeCard(
                    isHorizontal: true,
                    isSelected: false,
                    image: 'SpoonFork.png',
                    title: 'Others',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Select your pickup location"),
                const SizedBox(
                  height: 5,
                ),
                AppOutlineButton(
                  onPressed: () {},
                  text: "Select your Location",
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ContinueButton(
              onPressed: () {},
              text: "Continue",
              icon: Icons.arrow_forward,
            )
          ],
        ),
      ),
    ));
  }
}
