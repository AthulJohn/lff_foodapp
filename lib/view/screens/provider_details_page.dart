import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/logic/getx_controllers/provider_controller.dart';
import 'package:lff_foodapp/models/provider_class.dart';
import 'package:lff_foodapp/view/components/location_card.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:lff_foodapp/view/components/role_card.dart';
import 'package:lff_foodapp/view/components/type_card.dart';

import '../../constants/appColors.dart';
import '../../data/getx_storage.dart';
import '../../navigation/routes.dart';
import '../components/app_text_field.dart';
import '../components/title_text.dart';

class ProviderDetailsPage extends StatelessWidget {
  const ProviderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetXStorageManager.saveUserStatus(UserStatus.signedup);
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
                  onChanged: (val) {
                    providerController.setName(val);
                  },
                  hintText: "Tasty Restaurant",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<ProviderController>(builder: (controller) {
              return Column(
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
                      children: [
                        Expanded(
                          child: TypeCard(
                            isHorizontal: false,
                            isSelected: controller.provider.orgType ==
                                OrgType.restaurant,
                            image: 'Restaurant.png',
                            title: 'Restaurant',
                            onTap: () =>
                                controller.setOrgType(OrgType.restaurant),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TypeCard(
                            isHorizontal: false,
                            isSelected:
                                controller.provider.orgType == OrgType.catering,
                            image: 'Catering.png',
                            title: 'Catering',
                            onTap: () =>
                                providerController.setOrgType(OrgType.catering),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: TypeCard(
                      isHorizontal: true,
                      isSelected: controller.provider.orgType == OrgType.others,
                      image: 'SpoonFork.png',
                      title: 'Others',
                      onTap: () =>
                          providerController.setOrgType(OrgType.others),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<ProviderController>(builder: (controller) {
              return providerController.locationIsSet
                  ? LocationCard(
                      hasMap: true,
                      pLocation: providerController.provider.pLocation,
                      onTap: () {
                        Get.toNamed(Routes.locationSelector);
                      },
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Select your pickup location"),
                        const SizedBox(
                          height: 5,
                        ),
                        AppOutlineButton(
                          onPressed: () {
                            Get.toNamed(Routes.locationSelector);
                          },
                          text: "Select your Location",
                        )
                      ],
                    );
            }),
            const SizedBox(
              height: 20,
            ),
            ContinueButton(
              onPressed: () {
                Get.toNamed(Routes.provideraddnDetails);
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
