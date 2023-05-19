import 'package:flutter/material.dart';

import '../../../constants/graphics.dart';
import '../../components/orderwidgets.dart';
import 'package:get/get.dart';

import 'orderconfirm.dart';

int flag = 0;
List<Step> steps = [
  const Step(
    title: Text('Specify the number of serves needed'),
    content: CounterField(),
    isActive: true,
  ),
  const Step(
    title: Text('Specify your food preference'),
    content: foodPreference(),
    isActive: true,
  ),
  const Step(
    title: Text('Select you location'),
    content: LocationSelect(),
    isActive: true,
  ),
  const Step(
    title: Text('Finalise your order'),
    content: FinaliseOrder(),
    isActive: true,
  ),
];

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(graphicsFaded2),
            ),
          ),
          Positioned.fill(
            top: 85,
            left: 30,
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(orderText),
            ),
          ),
          Positioned.fill(
            top: 175,
            right: 40,
            child: MakeOrder(),
          ),
        ],
      ),
    );
  }
}

class MakeOrder extends StatefulWidget {
  MakeOrder() : super();

  final String title = "Stepper Demo";

  @override
  MakeOrderState createState() => MakeOrderState();
}

class MakeOrderState extends State<MakeOrder> {
  //
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xff01D38A),
        colorScheme: ColorScheme.light(primary: Color(0xff01D38A)),
      ),
      child: Stepper(
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  height: 40,
                  width: 80,
                  child: InkWell(
                    onTap: details.onStepContinue,
                    child: Image.asset("assets/svg_assets/button.png"),
                  ),
                )),
              ],
            ),
          );
        },
        currentStep: this.currentStep,
        steps: steps,
        type: StepperType.vertical,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (currentStep < steps.length - 1) {
              currentStep = currentStep + 1;
            } else {
              flag = 1;
            }
          });
          if (flag == 1) {
            Get.to(OrderConfirm(veg: c.select.value, serves: c.count.value));
          }
        },
        onStepCancel: () {
          setState(() {
            if (currentStep > 0) {
              currentStep = currentStep - 1;
            } else {
              currentStep = 0;
            }
          });
        },
      ),
    );
  }
}
