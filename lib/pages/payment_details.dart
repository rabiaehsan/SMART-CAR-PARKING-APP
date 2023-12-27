// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:smart_car_parking/controller/model/car_model.dart';
// import 'package:smart_car_parking/pages/booking_page/booking_page.dart';
// import 'package:smart_car_parking/pages/homepage/homepage.dart';

// class Payment_Details extends StatefulWidget {
//   const Payment_Details({Key? key}) : super(key: key);

//   @override
//   State<Payment_Details> createState() => _Payment_DetailsState();
// }

// class _Payment_DetailsState extends State<Payment_Details> {
//   File? image;
  


//   Future<void> pickedImage() async {
//     try {
//       final pickedImage =
//           await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (pickedImage != null) {
//         final imageTemporary = File(pickedImage.path);
//         setState(() {
//           image = imageTemporary;
//         });
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (image != null) // Display the selected image if available
                
//               Container(
//                 margin: const EdgeInsets.all(20.0),
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: FileImage(image!),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   pickedImage();
//                 },
//                 child: const Text("Upload Payment Receipt"),
//               ),
//               const SizedBox(height: 10),
//               const Text("Send the required amount on below Details for booking"),
//               const SizedBox(height: 10),
//               const Text(
//                 "Bank Details :",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:[
//                   Text("Bank Name : Easypesa bank"),
//                   SizedBox(width: 10),
//                   Text("Owner Name : abc"),
//                 ],
//               ),
//               const SizedBox(height: 10),
//                const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Account No: 01234567890"),
//                   SizedBox(width: 10),
//                   Text("Total Cost : 60"),
//                 ],
//               ),
//               SizedBox(height: 20,),
//               ElevatedButton(
//                   onPressed: () {
                    
//                     Get.to( BookingPage(slotId: "$slotId", slotName: '$slotName'));
//                   },
//                   child: Text("Submit"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
  
// }
