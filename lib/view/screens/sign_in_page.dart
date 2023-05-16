import 'package:flutter/material.dart';

import '../../constants/appColors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Let's Fight for",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "FOOD",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              )
            ],
          ),
          Column(
            children: [
              Text("Enter your phone number")
              //TODO: Add PhoneTextField here
            ],
          )
        ],
      ),
    ));
  }
}
