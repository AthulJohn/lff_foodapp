import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:lff_foodapp/view/components/role_card.dart';
import 'package:lff_foodapp/view/components/type_card.dart';

import '../../constants/appColors.dart';
import '../components/app_text_field.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Thank you for being a",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "PROVIDER",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                )
              ],
            ),
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Enter your organization name"),
                    SizedBox(
                      height: 5,
                    ),
                    AppTextField(
                      onChanged: (val) {},
                      hintText: "Tasty Restaurant",
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Select your organization type"),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
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
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Select your pickup location"),
                SizedBox(
                  height: 5,
                ),
                AppOutlineButton(
                  onPressed: () {},
                  text: "Select your Location",
                )
              ],
            ),
            SizedBox(
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
