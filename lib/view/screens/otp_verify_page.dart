import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/appColors.dart';

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
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Let's get",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "STARTED",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  )
                ],
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
                      onCompleted: (pin) {},
                      onChanged: (pin) {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ContinueButton(
                  onPressed: () {},
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
