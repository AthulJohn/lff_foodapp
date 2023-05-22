import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/navigation/app_pages.dart';
import 'package:lff_foodapp/navigation/routes.dart';
import 'package:lff_foodapp/view/screens/customer_pages/order_food.dart';
import 'package:lff_foodapp/view/screens/auth/sign_in_page.dart';
import 'package:lff_foodapp/view/screens/customer_pages/homecustomer.dart';
import 'package:lff_foodapp/view/screens/customer_pages/orderconfirm.dart';
import 'package:lff_foodapp/view/screens/customer_pages/orderpage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'view/screens/provider_pages/homeprovider.dart';

import 'data/getx_storage.dart';
import 'view/screens/registration/location_select_page.dart';
import 'view/screens/auth/otp_verify_page.dart';
import 'view/screens/registration/provider_addn_details_page.dart';
import 'view/screens/registration/provider_details_page.dart';
import 'view/screens/registration/role_select_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetXStorageManager.initStorage();
  await Supabase.initialize(
      url: "https://lkhjuvinceazfuwvvlhe.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxraGp1dmluY2VhemZ1d3Z2bGhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQyMTExOTEsImV4cCI6MTk5OTc4NzE5MX0.Gt4fAaIvcenrs-x6Fyvwu7cphtC9YtAY9_ji_REJnQo");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      title: "LFF- Let's Fight for Food",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sunflower',
      ),
      // home: const HomeCustomer(),
      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return OrderConfirm(veg: 0, serves: 0);
//   }
// }
