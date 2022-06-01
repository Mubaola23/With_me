import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/core/constants/colors.dart';
import 'package:with_me/src/features/calls/views/calls_screen.dart';
import 'package:with_me/src/features/dashboard/views/dashboard_screen.dart';
import 'package:with_me/src/features/meets/views/meets_screen.dart';

import '../controller/home_controller.dart';
import '../model/nav_bar.dart';

class HomeScreenView extends StatelessWidget {
  final List<Widget> _children = [
    const DashBoardScreen(),
    const MeetsScreen(),
    const CallsScreen(),
    Center(child: const Text("4")),
  ];

  final String? email;
  HomeScreenView({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        body: _children[controller.currentPage],
        bottomNavigationBar: NavBar(
          backgroundColor: AppColors.light,
          color: const Color(0xFF9E9E9E),
          selectedColor: AppColors.primaryColor,
          onTabSelected: controller.onTabSelected,
          items: [
            NavBarItem(img: AppImages.home, iconText: 'Home'),
            NavBarItem(img: AppImages.meets, iconText: 'Meets'),
            NavBarItem(img: AppImages.calls, iconText: 'Calls'),
            NavBarItem(img: AppImages.settings, iconText: 'Settings'),
          ],
        ),
      ),
    );
  }
}
