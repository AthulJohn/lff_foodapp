import 'package:get/get.dart';
import 'package:lff_foodapp/view/screens/onboarding.dart';
import 'package:lff_foodapp/view/screens/otp_verify_page.dart';
import 'package:lff_foodapp/view/screens/role_select_page.dart';
import 'package:lff_foodapp/view/screens/sign_in_page.dart';

import 'routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signInRoute;

  static final routes = [
    GetPage(
      name: Routes.onboardingRoute,
      page: () => const Onboarding(),
    ),
    GetPage(
      name: Routes.signInRoute,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: Routes.otpRoute,
      page: () => const OTPVerifyPage(),
    ),
    GetPage(
      name: Routes.userTypeSelection,
      page: () => const RoleSelectPage(),
    ),
  ];
}
