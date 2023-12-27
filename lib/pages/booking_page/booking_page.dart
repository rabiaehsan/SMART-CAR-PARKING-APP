import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_car_parking/controller/PakingController.dart';
import 'package:smart_car_parking/pages/payment_details.dart';
import '../../config/colors.dart';

class BookingPage extends StatefulWidget {

  final String slotName;
  final String slotId;
   BookingPage({super.key, required this.slotId, required this.slotName});

  @override
  State<BookingPage> createState() => _BookingPageState();
  
  
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "BOOK SLOT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animation/running_car.json',
                    width: 300,
                    height: 200,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Book Now 🚗",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: blueColor,
              ),
              SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter your name ",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: parkingController.name,
                      decoration: const InputDecoration(
                        fillColor: lightBg,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: blueColor,
                        ),
                        hintText: "Your Name",
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter Vehical Number ",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: parkingController.vehicalNumber,
                      decoration: const InputDecoration(
                        fillColor: lightBg,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.car_rental,
                          color: blueColor,
                        ),
                        hintText: "WB 04 ED 0987",
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Choose Slot Time (in Minuits)",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Obx(
                () => Slider(
                  mouseCursor: MouseCursor.defer,
                  thumbColor: blueColor,
                  activeColor: blueColor,
                  inactiveColor: lightBg,
                  label: "${parkingController.parkingTimeInMin.value} min",
                  value: parkingController.parkingTimeInMin.value,
                  onChanged: (v) {
                    parkingController.parkingTimeInMin.value = v;
                    if (v <= 30) {
                      parkingController.parkingAmount.value = 30;
                    } else {
                      parkingController.parkingAmount.value = 60;
                    }
                    //  parkingController.parkingAmount.value = (parkingController.parkingTimeInMin.value * 10).round();
                  },
                  divisions: 5,
                  min: 10,
                  max: 60,
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("10"),
                    Text("20"),
                    Text("30"),
                    Text("40"),
                    Text("50"),
                    Text("60"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Your Slot Name",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        widget.slotName,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     // Navigate to Payment_Details page
                  //     Get.to(const Payment_Details());
                  //   },
                  //   child: Container(
                  //     width: 200,
                  //     height: 80,
                  //     decoration: BoxDecoration(
                  //       color: blueColor,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         "Add Payment Details",
                  //         style: TextStyle(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w700,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
                
              ),
              Column(
                children: [
                  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (image != null) // Display the selected image if available
                
              Container(
                margin: const EdgeInsets.all(20.0),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FileImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  pickedImage();
                },
                child: const Text("Upload Payment Receipt"),
              ),
              const SizedBox(height: 10),
              const Text("Send the required amount on below Details for booking"),
              const SizedBox(height: 10),
              const Text(
                "Bank Details :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Bank Name : Easypesa bank"),
                  SizedBox(width: 10),
                  Text("Owner Name : abc"),
                ],
              ),
              const SizedBox(height: 10),
               const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Account No: 01234567890"),
                  SizedBox(width: 10),
                  Text("Total Cost : 60"),
                ],
              ),
              SizedBox(height: 20,),
              // ElevatedButton(
              //     onPressed: () {
                    
              //       Get.to( BookingPage(slotId: "$slotId", slotName: '$slotName'));
              //     },
              //     child: Text("Submit"))
            ],
          ),
        ),
                ],
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text("Amount to Be Pay"),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Rs.',
                            style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 6, 83, 146)),
                          ),
                          //  const  Icon(
                          //     Icons.currency_rupee,
                          //     size: 30,
                          //     color: blueColor,
                          //   ),
                          Obx(
                            () => Text(
                              "${parkingController.parkingAmount.value}",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: blueColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      parkingController.bookParkingSlot(widget.slotId);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 20),
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "PAY NOW",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
   File? image;
  

  Future<void> pickedImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final imageTemporary = File(pickedImage.path);
        setState(() {
          image = imageTemporary;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
 
}
