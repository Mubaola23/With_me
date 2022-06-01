import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/core/constants/dimensions.dart';
import 'package:with_me/src/core/utilities/base_change_notifier.dart';
import 'package:with_me/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../widgets/responssive.dart';
import '../../../widgets/spacing.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget>? imageSliders = [
      GestureDetector(
        onTap: () => Get.toNamed("/closeAlert"),
        child: Container(
          clipBehavior: Clip.antiAlias,
          // margin: const EdgeInsets.symmetric(
          //   horizontal: Dimensions.big,
          // ),
          // height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.demo), fit: BoxFit.fill),
            color: AppColors.primaryColor,
            // border: Border.all(color: AppColors.grey1),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    // width: 200.0,
                    // height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Adesina Bode",
                            style: bodyText1(context).copyWith(
                              color: AppColors.light,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "12 minutes away",
                            style: bodyText1(context).copyWith(
                              color: AppColors.light,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "interests",
                                style: bodyText1(context).copyWith(
                                  color: AppColors.light,
                                ),
                              ),
                              Icon(
                                Icons.music_note_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              ),
                              Icon(
                                Icons.videocam_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              ),
                              Icon(
                                Icons.female_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () => Get.toNamed("/closeAlert"),
        child: Container(
          clipBehavior: Clip.antiAlias,
          // margin: const EdgeInsets.symmetric(
          //   horizontal: Dimensions.big,
          // ),
          // height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.demo), fit: BoxFit.fill),
            color: AppColors.primaryColor,
            // border: Border.all(color: AppColors.grey1),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    // width: 200.0,
                    // height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Adesina Bode",
                            style: bodyText1(context).copyWith(
                              color: AppColors.light,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "12 minutes away",
                            style: bodyText1(context).copyWith(
                              color: AppColors.light,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "interests",
                                style: bodyText1(context).copyWith(
                                  color: AppColors.light,
                                ),
                              ),
                              Icon(
                                Icons.music_note_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              ),
                              Icon(
                                Icons.videocam_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              ),
                              Icon(
                                Icons.female_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () => Get.toNamed("/closeAlert"),
        child: Container(
          clipBehavior: Clip.antiAlias,
          // margin: const EdgeInsets.symmetric(
          //   horizontal: Dimensions.big,
          // ),
          // height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.demo), fit: BoxFit.fill),
            color: AppColors.primaryColor,
            // border: Border.all(color: AppColors.grey1),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    // width: 200.0,
                    // height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Adesina Bode",
                            style: bodyText1(context).copyWith(
                              color: AppColors.light,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "12 minutes away",
                            style: bodyText1(context).copyWith(
                              color: AppColors.light,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "interests",
                                style: bodyText1(context).copyWith(
                                  color: AppColors.light,
                                ),
                              ),
                              Icon(
                                Icons.music_note_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              ),
                              Icon(
                                Icons.videocam_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              ),
                              Icon(
                                Icons.female_outlined,
                                color: AppColors.light,
                                size: responsive12(context),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    return StatusBar(
      child: GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (controller) {
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.big,
                  ),
                  child: controller.state == AppState.loading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            _header(context, controller.appUser!.firstName),
                            const Spacing.smallHeight(),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacing.largeHeight(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Dimensions.big),
                                      child: Text(
                                        "Recent Activity",
                                        style: heading2(context).copyWith(
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                    const Spacing.smallHeight(),
                                    Responsive.isMobile(context)
                                        ? SizedBox(
                                            height: 120,
                                            width: double.infinity,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 6,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemBuilder: (context, index) =>
                                                  _recentActivity1(context),
                                            ),
                                          )
                                        : GridView.builder(
                                            itemCount: 8,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            keyboardDismissBehavior:
                                                ScrollViewKeyboardDismissBehavior
                                                    .onDrag,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              // childAspectRatio: 12 / 8,
                                              mainAxisSpacing: Dimensions.big,
                                              crossAxisSpacing: Dimensions.big,
                                            ),
                                            itemBuilder: (context, index) =>
                                                Expanded(
                                                    child: _recentActivity2(
                                                        context)),
                                          ),
                                    const Spacing.largeHeight(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Dimensions.big),
                                      child: Text(
                                        "Friends close to you",
                                        style: heading2(context).copyWith(
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                    const Spacing.smallHeight(),
                                    CarouselSlider(
                                      items: imageSliders,
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.7,
                                        aspectRatio: 1,
                                        initialPage: 1,
                                        // onPageChanged: (index, _) => context
                                        //     .read(dashboardScreenNotifier)
                                        //     .visibleCarousel(index)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          }),
    );
  }

  Widget _recentActivity1(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: Dimensions.small, right: Dimensions.small),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.medium, vertical: Dimensions.big),
      width: MediaQuery.of(context).size.width / 1.9,
      height: MediaQuery.of(context).size.height / 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dark),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Park’s Avenue",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: heading2(context)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "6 hours ago",
                style: bodyText1(context).copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w600),
              ),
              Stack(
                children: [
                  Align(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: AppColors.primaryColor),
                          shape: BoxShape.circle),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _recentActivity2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.medium, vertical: Dimensions.big),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dark),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Park’s Avenue",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: heading2(context)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "6 hours ago",
                style: bodyText1(context).copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w600),
              ),
              Stack(
                children: [
                  Align(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: AppColors.primaryColor),
                          shape: BoxShape.circle),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _header(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.big),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome,",
                    style: heading2(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Spacing.tinyHeight(),
                  Text(
                    name,
                    style: heading1(context),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.notifications,
                  ),
                  const Spacing.mediumWidth(),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: AppColors.primaryColor),
                        shape: BoxShape.circle),
                  )
                ],
              ),
            ],
          ),
          const Spacing.smallHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primaryColor,
                    size: Responsive.isLowerMobile(context)
                        ? responsive18(context)
                        : 20,
                  ),
                  const Spacing.tinyWidth(),
                  Text(
                    "Your location is active",
                    style: heading4(context).copyWith(
                        color: AppColors.dark, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => Get.to(() => ViewOnMap()),
                child: Text(
                  "View Map",
                  style: heading4(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ViewOnMap extends StatelessWidget {
  const ViewOnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
                target: controller.initialcameraposition, zoom: 15),
            mapType: MapType.normal,
            onMapCreated: controller.onMapCreated,
            myLocationEnabled: true,
          );
        });
  }
}
