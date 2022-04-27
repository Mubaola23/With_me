import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/core/utilities/base_change_notifier.dart';

class DirectionController extends BaseChangeNotifier {
  Completer<GoogleMapController> _controller = Completer();
  Completer<GoogleMapController> get controller => _controller;
  BitmapDescriptor? sourceIcon;
  BitmapDescriptor? destinationIcon;
  Set<Marker> _makers = Set<Marker>();
  Set<Marker> get makers => _makers;
  LatLng? currentLocation;
  LatLng? destinationLocation;
  static const double CAMERA_ZOOM = 16;
  static const double CAMERA_TILT = 80;
  static const double CAMERA_BEARING = 30;

  CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(42.7477863, -71.1699932),
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING);

  void onInit() async {
    currentLocation = const LatLng(42.7477863, -71.1699932);
    destinationLocation = const LatLng(42.743902, -71170009);
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0), AppImages.gmail);
    super.onInit();
  }
}
