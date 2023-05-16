import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/navigation/app_pages.dart';
import 'package:lff_foodapp/navigation/routes.dart';
import 'package:lff_foodapp/view/screens/order_food.dart';
import 'package:lff_foodapp/view/screens/sign_in_page.dart';

import 'data/getx_storage.dart';
import 'view/screens/otp_verify_page.dart';
import 'view/screens/provider_addn_details_page.dart';
import 'view/screens/provider_details_page.dart';
import 'view/screens/role_select_page.dart';

void main() async {
  await GetXStorageManager.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "LFF- Let's Fight for Food",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sunflower',
      ),
      home: const SignInPage(),
      getPages: AppPages.routes,
    );
  }
}
