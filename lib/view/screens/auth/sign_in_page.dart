import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/data/getx_storage.dart';
import 'package:lff_foodapp/logic/getx_controllers/user_controller.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../constants/appColors.dart';
import '../../../models/user_class.dart';
import '../../../navigation/routes.dart';
import '../../components/title_text.dart';

/*
curl -X POST 'https://cvwawazfelidkloqmbma.supabase.co/auth/v1/otp' \
-H "apikey: SUPABASE_KEY" \
-H "Content-Type: application/json" \
-d '{
  "phone": "+13334445555"
}'
*/

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetXStorageManager.saveUserStatus(UserStatus.onBoarded);
    Get.put(UserController());
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
                    const Text("Enter your phone number"),
                    const SizedBox(
                      height: 10,
                    ),
                    PhoneField(
                      onChanged: (phone) {
                        Get.find<UserController>()
                            .setPhone(phone.completeNumber);
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: LoaderButton(),
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

class LoaderButton extends StatefulWidget {
  const LoaderButton({super.key});

  @override
  State<LoaderButton> createState() => _LoaderButtonState();
}

class _LoaderButtonState extends State<LoaderButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return isLoading
        ? CircularProgressIndicator(
            color: AppColors.primaryColor,
          )
        : ContinueButton(
            onPressed: () async {
              // print(Get.find<UserController>().user.phone);
              setState(() {
                isLoading = true;
              });
              String phone = "";
              try {
                phone = Get.find<UserController>().user.phone;
                await supabase.auth.signInWithOtp(
                  phone: phone,
                );
              } catch (e) {
                print(e.toString());
              }
              Get.snackbar("OTP Not Sent",
                  "Sorry, OTP verification not yet implemented. Enter any 6 digit code to continue.");
              Get.toNamed(Routes.otpRoute);
            },
            text: "Sent OTP",
            icon: Icons.arrow_forward,
          );
  }
}
