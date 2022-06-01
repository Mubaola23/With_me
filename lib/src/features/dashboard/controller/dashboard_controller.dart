import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:with_me/src/core/constants/app_user.dart';
import 'package:with_me/src/core/utilities/base_change_notifier.dart';
import 'package:with_me/src/repositories/authentication_repository.dart';
import 'package:with_me/src/repositories/dashboard_repository.dart';

import '../../../core/constants/failure.dart';

class DashboardController extends BaseChangeNotifier {
  final authRepo = Get.find<AuthenticationRepository>();
  final dashboardRepo = Get.find<DashboardRepository>();

  @override
  onInit() {
    getLoc();
    getAuthenticatedUser();
    super.onInit();
  }

  LocationData? _currentPosition;
  String? _address, _dateTime;
  Marker? marker;
  Location location = Location();

  GoogleMapController? _controller;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);
  LatLng get initialcameraposition => _initialcameraposition;
  AppUser? _appUser;
  AppUser? get appUser => _appUser;

  updateUserLocation() async {
    await dashboardRepo.updateLocation(
        "${_currentPosition?.latitude}-${_currentPosition?.longitude}");
  }

  void getAuthenticatedUser() async {
    setState(state: AppState.loading);
    try {
      _appUser = await authRepo.getAuthenticatedUser();

      setState(state: AppState.idle);
    } on Failure catch (ex) {
      setState(state: AppState.idle);
      Get.snackbar(
        'Error',
        ex.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void onMapCreated(GoogleMapController _cntlr) {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    print("sending");
    await updateUserLocation();

    _initialcameraposition =
        LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      _currentPosition = currentLocation;
      _initialcameraposition =
          LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
      setState();

      DateTime now = DateTime.now();
      _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);
      // _getAddress(_currentPosition!.latitude!, _currentPosition!.longitude!)
      //     .then((value) {
      //     _address = "${value.first.addressLine}";
      //     setState();
      // });
    });
  }

  // Future<List<Address>> _getAddress(double lat, double lang) async {
  //   final coordinates = new Coordinates(lat, lang);
  //   List<Address> add =
  //   await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   return add;
  // }

}
