import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/logic/getx_controllers/order_controller.dart';
import 'package:lff_foodapp/logic/getx_controllers/order_page_controller.dart';
import 'package:lff_foodapp/models/order_class.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';
import 'package:lff_foodapp/view/components/cards/role_card.dart';
import 'package:lff_foodapp/view/components/text_fields/time_field.dart';
import 'package:lff_foodapp/view/components/cards/type_card.dart';
import 'package:lff_foodapp/view/screens/customer_pages/orderconfirm.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constants/appColors.dart';
import '../../../models/user_class.dart';
import '../../../navigation/routes.dart';
import '../../components/cards/location_card.dart';
import '../../components/text_fields/app_text_field.dart';
import '../../components/title_text.dart';

class OrderFoodPage extends StatelessWidget {
  const OrderFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderPageController orderPageController = Get.put(OrderPageController());
    OrderController orderController = Get.put(OrderController(
        Order(customerName: "", customerPhone: "", orderTime: DateTime(2024))));
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Graphics.png"),
              opacity: 0.24,
              fit: BoxFit.cover)),
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<OrderController>(
              builder: (controller) => ListView(
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
                          afterLineStyle:
                              const LineStyle(color: AppColors.primaryColor),
                          axis: TimelineAxis.vertical,
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          endChild: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                                Text("Specify the number of serves to order"),
                          ),
                          isFirst: true,
                          indicatorStyle: const IndicatorStyle(
                              color: AppColors.primaryColor),
                        ),
                      ),
                      if (orderPageController.step == 0)
                        TimelineTile(
                            beforeLineStyle:
                                const LineStyle(color: AppColors.primaryColor),
                            afterLineStyle:
                                const LineStyle(color: AppColors.borderColor),
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
                                        onPressed: () {
                                          orderController.setSeves(
                                              orderController.order.serveCount -
                                                  1);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: AppTextField(
                                        hintText: "0",
                                        align: TextAlign.center,
                                        onChanged: (val) {
                                          orderController
                                              .setSeves(int.tryParse(val) ?? 0);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          orderController.setSeves(
                                              orderController.order.serveCount -
                                                  1);
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ContinueButton(
                                  onPressed: () {
                                    orderPageController.nextStep();
                                  },
                                  icon: Icons.arrow_downward,
                                  padding: 20,
                                )
                              ],
                            )),
                      SizedBox(
                        height: 50,
                        child: TimelineTile(
                          beforeLineStyle: LineStyle(
                              color: orderPageController.step < 1
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
                          afterLineStyle: LineStyle(
                              color: orderPageController.step < 1
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
                          indicatorStyle: IndicatorStyle(
                              color: orderPageController.step < 1
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
                          axis: TimelineAxis.vertical,
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          endChild: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Specify your food preference",
                                style: TextStyle(
                                    color: orderPageController.step > 0
                                        ? Colors.black
                                        : AppColors.borderColor)),
                          ),
                        ),
                      ),
                      // next step code
                      if (orderPageController.step == 1)
                        TimelineTile(
                            beforeLineStyle:
                                const LineStyle(color: AppColors.primaryColor),
                            afterLineStyle:
                                const LineStyle(color: AppColors.borderColor),
                            hasIndicator: false,
                            axis: TimelineAxis.vertical,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.1,
                            endChild: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: TypeCard(
                                            isHorizontal: false,
                                            isSelected: orderController
                                                    .order.orderType ==
                                                OrderType.veg,
                                            title: "VEG",
                                            onTap: () {
                                              orderController
                                                  .setOrderType(OrderType.veg);
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: TypeCard(
                                            isHorizontal: false,
                                            isSelected: orderController
                                                    .order.orderType ==
                                                OrderType.nonVeg,
                                            title: "NON VEG",
                                            onTap: () {
                                              orderController.setOrderType(
                                                  OrderType.nonVeg);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: TypeCard(
                                      isHorizontal: true,
                                      isSelected:
                                          orderController.order.orderType ==
                                              OrderType.vegan,
                                      title: "VEGAN",
                                      onTap: () {
                                        orderController
                                            .setOrderType(OrderType.vegan);
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ContinueButton(
                                  onPressed: () {
                                    orderPageController.nextStep();
                                  },
                                  icon: Icons.arrow_downward,
                                  padding: 20,
                                )
                              ],
                            )),

                      SizedBox(
                        height: 50,
                        child: TimelineTile(
                          beforeLineStyle: LineStyle(
                              color: orderPageController.step < 2
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
                          afterLineStyle: LineStyle(
                              color: orderPageController.step < 2
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
                          indicatorStyle: IndicatorStyle(
                              color: orderPageController.step < 2
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
                          axis: TimelineAxis.vertical,
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          endChild: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Select your location",
                                style: TextStyle(
                                    color: orderPageController.step < 1
                                        ? AppColors.borderColor
                                        : Colors.black)),
                          ),
                        ),
                      ),
                      if (orderPageController.step == 2)
                        SizedBox(
                            height: 50,
                            child: TimelineTile(
                              endChild: GetBuilder<OrderController>(
                                  builder: (controller) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text("Select your pickup location"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppOutlineButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.locationSelector,
                                            arguments: {
                                              "type": UserType.customer
                                            });
                                      },
                                      text: "Select your Location",
                                    )
                                  ],
                                );
                              }),
                            )),
                      SizedBox(
                        height: 50,
                        child: TimelineTile(
                          beforeLineStyle: LineStyle(
                              color: orderPageController.step < 3
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
                          indicatorStyle: IndicatorStyle(
                              color: orderPageController.step < 3
                                  ? AppColors.borderColor
                                  : AppColors.primaryColor),
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
                      if (orderPageController.step == 3)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ContinueButton(
                              onPressed: () {
                                Get.off(OrderConfirm(
                                    veg: orderController.order.orderType ==
                                            OrderType.nonVeg
                                        ? 1
                                        : 0,
                                    serves: orderController.order.serveCount));
                              },
                              icon: Icons.arrow_forward,
                              padding: 20,
                            )
                          ],
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
                  ))),
    ));
  }
}
