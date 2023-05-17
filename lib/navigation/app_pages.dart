import 'package:get/get.dart';
import 'package:lff_foodapp/view/screens/onboarding.dart';
import 'package:lff_foodapp/view/screens/otp_verify_page.dart';
import 'package:lff_foodapp/view/screens/provider_addn_details_page.dart';
import 'package:lff_foodapp/view/screens/provider_details_page.dart';
import 'package:lff_foodapp/view/screens/role_select_page.dart';
import 'package:lff_foodapp/view/screens/sign_in_page.dart';

import '../view/screens/customer_details_page.dart';
import '../view/screens/location_select_page.dart';
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
    GetPage(
      name: Routes.providerDetails,
      page: () => const ProviderDetailsPage(),
    ),
    GetPage(
      name: Routes.provideraddnDetails,
      page: () => const ProviderAddnDetailsPage(),
    ),
    GetPage(
      name: Routes.customerDetails,
      page: () => const CustomerDetailsPage(),
    ),
    GetPage(
      name: Routes.locationSelector,
      page: () => const LocationSelectorPage(),
    ),
  ];
}
