import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/logic/getx_controllers/provider_controller.dart';
import 'package:lff_foodapp/models/provider_class.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';
import 'package:lff_foodapp/view/components/cards/role_card.dart';
import 'package:lff_foodapp/view/components/cards/type_card.dart';

import '../../../constants/appColors.dart';
import '../../../data/getx_storage.dart';
import '../../../logic/getx_controllers/customer_controller.dart';
import '../../../navigation/routes.dart';
import '../../components/text_fields/app_text_field.dart';
import '../../components/title_text.dart';

class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetXStorageManager.saveUserStatus(UserStatus.signedup);
    CustomerController customerController = Get.find<CustomerController>();
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
              greenText: "CUSTOMER",
              size: 28,
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: const TextSpan(
              children: [
                TextSpan(
                    text: "Let's get you ",
                    style: TextStyle(
                      color: Colors.black,
                    )),
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
                const Text("Enter your name"),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {
                    customerController.setName(val);
                  },
                  hintText: "Name",
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
                const Text("Select your default location"),
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
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                    "Enter the maximum pickup distance that can be considered(in Kms)"),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {
                    double? value = double.tryParse(val);
                    if (value == null) return;
                    customerController.setMaxDistance(value);
                  },
                  hintText: "10",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ContinueButton(
              onPressed: () {
                Get.offAllNamed(Routes.customerHome);
              },
              text: "Get Started",
              icon: Icons.arrow_forward,
            )
          ],
        ),
      ),
    ));
  }
}
