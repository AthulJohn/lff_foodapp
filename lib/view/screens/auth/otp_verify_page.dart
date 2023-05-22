import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/logic/getx_controllers/user_controller.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';
import 'package:lff_foodapp/view/components/title_text.dart';
import 'package:lff_foodapp/view/screens/auth/sign_in_page.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../constants/appColors.dart';
import '../../../logic/getx_controllers/otp_controller.dart';
import '../../../navigation/routes.dart';

class OTPVerifyPage extends StatelessWidget {
  const OTPVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    OTPController controller = Get.put(OTPController());
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
                        controller.setOTP(value!);
                      },
                      onChanged: (pin) {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: controller.isLoading.value
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : ContinueButton(
                        onPressed: () async {
                          int otp = controller.otp.value;
                          controller.load();
                          try {
                            final AuthResponse res =
                                await supabase.auth.verifyOTP(
                              phone: Get.find<UserController>().user.phone,
                              token: "$otp",
                              type: OtpType.sms,
                            );

                            print(res.session?.accessToken);
                          } catch (e) {
                            print(e.toString());
                          }
                          Get.toNamed(Routes.userTypeSelection);
                        },
                        text: "Confirm",
                        icon: Icons.arrow_forward,
                      ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 30,
                child: AppOutlineButton(
                  onPressed: () async {
                    Get.snackbar(
                        "Message not sent", "Continue with any 6 digit code");
                  },
                  text: "Resend OTP",
                  padding: 10,
                  fontSize: 12,
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
