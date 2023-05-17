import 'package:flutter/material.dart';

import '../../constants/appColors.dart';

class TypeCard extends StatelessWidget {
  const TypeCard(
      {super.key,
      this.isHorizontal = false,
      this.isSelected = false,
      this.image = 'SpoonFork.png',
      this.title = '',
      this.onTap});
  final bool isHorizontal, isSelected;
  final String image, title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
            width: isSelected ? 2 : 1),
      ),
      child: InkWell(
        onTap: onTap,
        child: isHorizontal
            ? Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/$image',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                  )),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        'assets/images/$image',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
                ],
              ),
      ),
    );
  }
}
