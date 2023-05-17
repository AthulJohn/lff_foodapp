import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/logic/getx_controllers/provider_controller.dart';
import 'package:lff_foodapp/logic/getx_controllers/user_controller.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:lff_foodapp/view/components/role_card.dart';

import '../../constants/appColors.dart';
import '../../logic/getx_controllers/customer_controller.dart';
import '../../models/user_class.dart';
import '../../navigation/routes.dart';
import '../components/title_text.dart';

class RoleSelectPage extends StatelessWidget {
  const RoleSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
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
                      const Text("I am a... "),
                      GetBuilder<UserController>(
                        builder: (controller) => RoleCard(
                          isCustomer: true,
                          isSelected:
                              userController.user.type == UserType.customer,
                          onTap: () {
                            userController.setType(UserType.customer);
                          },
                        ),
                      ),
                      GetBuilder<UserController>(
                        builder: (controller) => RoleCard(
                          isCustomer: false,
                          isSelected:
                              userController.user.type == UserType.provider,
                          onTap: () {
                            userController.setType(UserType.provider);
                          },
                        ),
                      ),
                      Center(
                        child: ContinueButton(
                          onPressed: () {
                            User user = userController.user;
                            print(user.type);
                            if (user.type == UserType.customer) {
                              Get.put(CustomerController(user));

                              Get.toNamed(Routes.customerDetails);
                            } else if (user.type == UserType.provider) {
                              Get.put(ProviderController(user));

                              Get.toNamed(Routes.providerDetails);
                            } else {
                              Get.snackbar("Error", "Please select a role");
                            }
                          },
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
      ),
    );
  }
}
