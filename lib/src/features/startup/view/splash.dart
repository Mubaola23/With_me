import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/features/startup/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => SvgPicture.asset(
        AppImages.splashBg,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
