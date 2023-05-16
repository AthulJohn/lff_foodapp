import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/view/screens/sign_in_page.dart';

import 'view/screens/otp_verify_page.dart';

void main() {
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
      home: const OTPVerifyPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
