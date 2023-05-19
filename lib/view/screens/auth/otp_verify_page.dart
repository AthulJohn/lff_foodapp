import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';
import 'package:lff_foodapp/view/components/title_text.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../constants/appColors.dart';
import '../../../logic/getx_controllers/otp_controller.dart';
import '../../../navigation/routes.dart';

class OTPVerifyPage extends StatelessWidget {
  const OTPVerifyPage({super.key});

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
                  children: [
                    Text("Enter the OTP received on your phone"),
                    SizedBox(
                      height: 10,
                    ),
                    //TODO: Add PhoneTextField here
                    OTPTextField(
                      length: 6,
                      fieldWidth: MediaQuery.of(context).size.width / 9,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: AppColors.secondaryColor,
                        borderColor: AppColors.borderColor,
                        focusBorderColor: AppColors.primaryColor,
                      ),
                      width: MediaQuery.of(context).size.width,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        int? value = int.tryParse(pin);
                        if (value == null) {
                          Get.snackbar("Invalid OTP",
                              "You might have entered the wrong OTP. Please try again!");
                        }
                        Get.put(OTPController()).setOTP(value!);
                      },
                      onChanged: (pin) {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ContinueButton(
                  onPressed: () {
                    Get.toNamed(Routes.userTypeSelection);
                  },
                  text: "Confirm",
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
