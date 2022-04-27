import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:with_me/src/features/dashboard/controller/direction_controller.dart';

class DirectionsScreen extends StatelessWidget {
  const DirectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DirectionController>(
          init: DirectionController(),
          builder: (controller) => Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Text(
                        "hhhhhhhhhhhhhhhhhhhhhhhhh\nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"),
                    Positioned.fill(
                        child: GoogleMap(
                      initialCameraPosition: controller.initialCameraPosition,
                      myLocationEnabled: true,
                      compassEnabled: false,
                      tiltGesturesEnabled: false,
                      markers: controller.makers,
                      onMapCreated: (GoogleMapController control) {
                        controller.controller.complete(control);
                      },
                    ))
                  ],
                ),
              )),
    );
  }
}
