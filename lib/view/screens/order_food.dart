import 'package:flutter/material.dart';
import 'package:lff_foodapp/view/components/phone_field.dart';
import 'package:lff_foodapp/view/components/proceed_button.dart';
import 'package:lff_foodapp/view/components/role_card.dart';
import 'package:lff_foodapp/view/components/time_field.dart';
import 'package:lff_foodapp/view/components/type_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants/appColors.dart';
import '../components/app_text_field.dart';
import '../components/title_text.dart';

class OrderFoodPage extends StatelessWidget {
  const OrderFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Graphics.png"),
              opacity: 0.24,
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const TitleText(
              blackText: "Let's get some",
              greenText: "FOOD",
              size: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TimelineTile(
                afterLineStyle: const LineStyle(color: AppColors.primaryColor),
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                endChild: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Specify the number of serves to order"),
                ),
                isFirst: true,
                indicatorStyle:
                    const IndicatorStyle(color: AppColors.primaryColor),
              ),
            ),
            TimelineTile(
                beforeLineStyle: const LineStyle(color: AppColors.primaryColor),
                afterLineStyle: const LineStyle(color: AppColors.borderColor),
                hasIndicator: false,
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                endChild: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.remove)),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 50,
                          child: AppTextField(
                            hintText: "0",
                            align: TextAlign.center,
                            onChanged: (val) {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ContinueButton(
                      onPressed: () {},
                      icon: Icons.arrow_downward,
                      padding: 20,
                    )
                  ],
                )),
            SizedBox(
              height: 50,
              child: TimelineTile(
                beforeLineStyle: const LineStyle(color: AppColors.borderColor),
                afterLineStyle: const LineStyle(color: AppColors.borderColor),
                indicatorStyle:
                    const IndicatorStyle(color: AppColors.borderColor),
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                endChild: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Specify your food preference",
                      style: TextStyle(color: AppColors.borderColor)),
                ),
              ),
            ),
            // next step code
            if (false)
              TimelineTile(
                  beforeLineStyle:
                      const LineStyle(color: AppColors.primaryColor),
                  afterLineStyle: const LineStyle(color: AppColors.borderColor),
                  hasIndicator: false,
                  axis: TimelineAxis.vertical,
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  endChild: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: const [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: TypeCard(
                                  isHorizontal: false,
                                  isSelected: true,
                                  title: "VEG",
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: TypeCard(
                                  isHorizontal: false,
                                  isSelected: false,
                                  title: "NON VEG",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TypeCard(
                            isHorizontal: true,
                            isSelected: false,
                            title: "VEGAN",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ContinueButton(
                        onPressed: () {},
                        icon: Icons.arrow_downward,
                        padding: 20,
                      )
                    ],
                  )),
            SizedBox(
              height: 50,
              child: TimelineTile(
                beforeLineStyle: const LineStyle(color: AppColors.borderColor),
                afterLineStyle: const LineStyle(color: AppColors.borderColor),
                indicatorStyle:
                    const IndicatorStyle(color: AppColors.borderColor),
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                endChild: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Select your location",
                      style: TextStyle(color: AppColors.borderColor)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: TimelineTile(
                beforeLineStyle: const LineStyle(color: AppColors.borderColor),
                indicatorStyle:
                    const IndicatorStyle(color: AppColors.borderColor),
                isLast: true,
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                endChild: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Finalize your order",
                      style: TextStyle(color: AppColors.borderColor)),
                ),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // ContinueButton(
            //   onPressed: () {},
            //   text: "Continue",
            //   icon: Icons.arrow_forward,
            // )
          ],
        ),
      ),
    ));
  }
}
