import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_car_parking/config/colors.dart';
import 'package:smart_car_parking/pages/homepage/homepage.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller = Completer();
    const LatLng center = LatLng(30.164232103933372, 66.99072095041458);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/white_logo.png",
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 20),
            const Text(
              "SMART CAR PARKING",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         // parkingController.timeCounter();
        //         Get.toNamed("/about-us");
        //       },
        //       icon: const Icon(
        //         Icons.person,
        //         color: Colors.white,
        //       )),
        // ],
        centerTitle: true,
      ),
      body: GoogleMap(
        buildingsEnabled: true,
        compassEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: center,
          zoom: 18.0,
        ),
        markers: {
          Marker(
            visible: true,
            onTap: () {
              Get.to(HomePage());
            },
            markerId:const MarkerId('parking_1'),
            position: LatLng(30.16259950918289, 66.98753448615786),
          ),
          Marker(
            visible: true,
            onTap: () {
              Get.to(HomePage());
            },
            markerId: MarkerId('parking_2'),
            position: LatLng(30.163128250215514, 66.99295254827786),
          ),
          Marker(
            visible: true,
            onTap: () {
              Get.to(HomePage());
            },
            markerId:const  MarkerId('parking_3'),
            position:const LatLng(30.16906065499878, 66.9858235690553),
          ),
          Marker(
            visible: true,
            onTap: () {
              Get.to(HomePage());
            },
            markerId: const MarkerId('parking_4'),
            position: const LatLng(30.15588825504711, 66.99090502902492),
          ),
          Marker(
            visible: true,
            onTap: () {
              Get.to(HomePage());
            },
            markerId: MarkerId('parking_5'),
            position: LatLng(23.251951095267497, 77.48558382672624),
          ),
        },
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }
}
