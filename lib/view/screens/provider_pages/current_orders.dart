import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/logic/getx_controllers/provider_controller.dart';
import 'package:lff_foodapp/models/order_class.dart';
import 'package:lff_foodapp/models/provider_class.dart';
import 'package:lff_foodapp/view/components/cards/location_card.dart';
import 'package:lff_foodapp/view/components/cards/order_card.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';
import 'package:lff_foodapp/view/components/cards/role_card.dart';
import 'package:lff_foodapp/view/components/cards/type_card.dart';

import '../../../constants/appColors.dart';
import '../../../data/getx_storage.dart';
import '../../../navigation/routes.dart';
import '../../components/text_fields/app_text_field.dart';
import '../../components/title_text.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({super.key});

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
              blackText: "Current",
              greenText: "ORDERS",
              size: 28,
            ),
            const SizedBox(
              height: 10,
            ),
            OrderCard(
                orderDetails: Order(
              customerName: "",
              customerPhone: "",
              orderTime: DateTime.now(),
              orderType: OrderType.veg,
            )),
          ],
        ),
      ),
    ));
  }
}
