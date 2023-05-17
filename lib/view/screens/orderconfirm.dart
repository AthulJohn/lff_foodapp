// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/orderwidgets.dart';

class OrderConfirm extends StatelessWidget {
  final int veg;
  final int serves;
  const OrderConfirm({super.key, required this.veg, required this.serves});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/svg_assets/order_placed.png'),
          const Text(
            "Your order will be ready for pickup at",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            children: [
              Image.asset(
                "assets/svg_assets/order_details_rect.png",
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Positioned(
                top: 7.5,
                right: 210,
                child: Image.asset(
                  "assets/svg_assets/hotel_image_placeholder.png",
                  width: 200,
                  height: 125,
                ),
              ),
              Positioned(
                top: 15,
                left: 120,
                child: Text(
                  "Cafe Manara Restaurant",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 120,
                child: Text(
                  "Kothamangalam",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                top: 65,
                left: 120,
                child: Text(
                  "⭐3.6",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/svg_assets/know_more.png",
                        width: 120,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/svg_assets/locate.png",
                        width: 120,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text("Y")
        ],
      ),
    );
  }
}
