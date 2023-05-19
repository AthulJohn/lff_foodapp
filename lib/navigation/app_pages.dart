import 'package:get/get.dart';
import 'package:lff_foodapp/view/screens/customer_pages/account_page.dart';
import 'package:lff_foodapp/view/screens/customer_pages/previous_order_cust_page.dart';
import 'package:lff_foodapp/view/screens/provider_pages/current_orders_prov.dart';
import 'package:lff_foodapp/view/screens/provider_pages/homeprovider.dart';
import 'package:lff_foodapp/view/screens/auth/onboarding.dart';
import 'package:lff_foodapp/view/screens/customer_pages/orderpage.dart';
import 'package:lff_foodapp/view/screens/auth/otp_verify_page.dart';
import 'package:lff_foodapp/view/screens/provider_pages/update_status.dart';
import 'package:lff_foodapp/view/screens/registration/provider_addn_details_page.dart';
import 'package:lff_foodapp/view/screens/registration/provider_details_page.dart';
import 'package:lff_foodapp/view/screens/registration/role_select_page.dart';
import 'package:lff_foodapp/view/screens/auth/sign_in_page.dart';

import '../view/screens/registration/customer_details_page.dart';
import '../view/screens/customer_pages/homecustomer.dart';
import '../view/screens/registration/location_select_page.dart';
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
    GetPage(name: Routes.providerHome, page: () => const HomeProvider()),
    GetPage(name: Routes.customerHome, page: () => const HomeCustomer()),
    GetPage(name: Routes.customerOrder, page: () => const OrderPage()),
    GetPage(
        name: Routes.previousorder, page: () => const PreviousOrderCustomer()),
    GetPage(name: Routes.customerAccount, page: () => const AccountPage()),
    GetPage(name: Routes.updateStatus, page: () => const UpdateStatusPage()),
    GetPage(
        name: Routes.currentOrders, page: () => const CurrentOrdersProvider()),
    GetPage(name: Routes.providerAccount, page: () => const AccountPage()),
  ];
}
