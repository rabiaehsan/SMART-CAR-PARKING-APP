import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_car_parking/Data.dart';
import 'package:smart_car_parking/controller/splace_controller.dart';

class Splace_Screen extends StatelessWidget {
  const Splace_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller before building the widget
    SplaceController splaceController = Get.put(SplaceController());

    // Rest of your widget tree remains the same
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animation/running_car.json',
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CAR PARKING",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "This is a Car parking app for Smart car parking station. Here you can find available slots and book your parking slot from anywhere with your phone.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
           const  Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   collegeLogo,
                  //   width: 200,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
