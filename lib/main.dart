// ignore_for_file: non_constant_identifier_names

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/routes.dart';
import 'package:with_me/src/core/theme.dart';
import 'package:with_me/src/services/navigation_service.dart';

import 'src/features/startup/view/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      defaultTransition: Transition.fadeIn,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: const Duration(seconds: 1),
      theme: AppTheme.lightTheme,
      // defaultGlobalState: Get.defaultGlobalState,
      title: 'Flutter Demo',
      initialRoute: "/",
      home: const SplashScreen(),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: NavigationService().navigatorKey,
    );
  }
}
