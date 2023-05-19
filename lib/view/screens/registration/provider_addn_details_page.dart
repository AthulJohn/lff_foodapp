import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';
import 'package:lff_foodapp/view/components/cards/role_card.dart';
import 'package:lff_foodapp/view/components/text_fields/time_field.dart';
import 'package:lff_foodapp/view/components/cards/type_card.dart';

import '../../../constants/appColors.dart';
import '../../../data/getx_storage.dart';
import '../../../logic/getx_controllers/provider_controller.dart';
import '../../../navigation/routes.dart';
import '../../components/text_fields/app_text_field.dart';

class ProviderAddnDetailsPage extends StatelessWidget {
  const ProviderAddnDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderController providerController = Get.find<ProviderController>();
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
            const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Enter your contact number"),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {
                    providerController.setContactNumber(val);
                  },
                  hintText: "Contact Number",
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
                const Text("Enter your secondary contact number (Optional)"),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {
                    providerController.setSecondaryNumber(val);
                  },
                  hintText: "Secondary Contact",
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
                const Text("Enter your default pickup time"),
                const SizedBox(
                  height: 5,
                ),
                TimeField(
                  onChanged: (time) {
                    providerController.setPickupTime(time);
                  },
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
                const Text("Enter your default price per serve (in Rs.)"),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  onChanged: (val) {
                    double? value = double.tryParse(val);
                    if (value == null) return;
                    providerController.setPricePerMeal(value);
                  },
                  hintText: "50",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ContinueButton(
              onPressed: () {
                print(
                    "${providerController.provider.contactNumber} ${providerController.provider.secondaryNumber} ${providerController.provider.pickupTime} ${providerController.provider.pricePerMeal} ${providerController.provider.type} ${providerController.provider.name} ");

                GetXStorageManager.saveUserStatus(UserStatus.registered);
                Get.snackbar(
                    'Done', 'You have succesfully signed up as a provider');
                Get.offAllNamed(Routes.providerHome);
              },
              text: "Continue",
              icon: Icons.arrow_forward,
            )
          ],
        ),
      ),
    ));
  }
}
