import 'package:flutter/material.dart';
import 'package:lff_foodapp/constants/appColors.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key, this.isCustomer = true, this.isSelected = false});
  final bool isCustomer, isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AspectRatio(
                  aspectRatio: 1.25,
                  child: Image.asset(
                    isCustomer
                        ? 'assets/images/Customer.png'
                        : 'assets/images/Provider.png',
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isCustomer ? 'CUSTOMER' : 'PROVIDER',
                      style: const TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                    Text(
                      isCustomer
                          ? 'Who would like to purchase abundant food'
                          : "Who would like to sell abundant food",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                )),
          ],
        ));
  }
}
