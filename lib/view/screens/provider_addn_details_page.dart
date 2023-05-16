import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:lff_foodapp/view/components/role_card.dart';
import 'package:lff_foodapp/view/components/time_field.dart';
import 'package:lff_foodapp/view/components/type_card.dart';

import '../../constants/appColors.dart';
import '../components/app_text_field.dart';

class ProviderAddnDetailsPage extends StatelessWidget {
  const ProviderAddnDetailsPage({super.key});

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
            SizedBox(
              height: 10,
            ),
            RichText(
                text: const TextSpan(
              children: [
                TextSpan(text: "Let's "),
                TextSpan(
                  text: "WRAP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                TextSpan(text: " it up!"),
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
                const Text("Enter your contact number"),
                SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {},
                  hintText: "Contact Number",
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
                const Text("Enter your secondary contact number (Optional)"),
                SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {},
                  hintText: "Secondary Contact",
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
                const Text("Enter your default pickup time"),
                SizedBox(
                  height: 5,
                ),
                TimeField()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Enter your default price per serve (in Rs.)"),
                SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {},
                  hintText: "50",
                ),
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
