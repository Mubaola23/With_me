import 'dart:ui';

import 'package:analog_clock/analog_clock.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/features/dashboard/controller/request_meet_controller.dart';
import 'package:with_me/src/features/dashboard/model/time_pill.dart';
import 'package:with_me/src/widgets/app_button.dart';
import 'package:with_me/src/widgets/app_textfield.dart';
import 'package:with_me/src/widgets/spacing.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class RequestMeet1 extends StatelessWidget {
  const RequestMeet1({Key? key}) : super(key: key);
  final StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.primaryColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Request Meet",
                style:
                    heading2(context).copyWith(color: AppColors.primaryColor)),
          ),
          body: Column(
            children: [
              GetBuilder<RequestMeetController>(
                init: RequestMeetController(),
                builder: (controller) => Expanded(
                  child: Stepper(
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    type: stepperType,
                    physics: const ScrollPhysics(),
                    currentStep: controller.currentStep,
                    onStepTapped: (step) => controller.tapped(step),
                    controlsBuilder: (BuildContext context, controlDetails) {
                      return Container();
                    },
                    // onStepCancel: cancel,
                    steps: <Step>[
                      Step(
                        content: const First(),
                        isActive: controller.currentStep == 0,
                        state: controller.currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                        title: Text(""),
                      ),
                      Step(
                        title: Text(''),
                        content: const Second(),
                        isActive: controller.currentStep == 1,
                        state: controller.currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text(''),
                        content: const Third(),
                        isActive: controller.currentStep == 2,
                        state: controller.currentStep == 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      // Step(
                      //   title: new Text(''),
                      //   content: Third(),
                      //   isActive: controller.currentStep >= 0,
                      //   state: controller.currentStep >= 2
                      //       ? StepState.complete
                      //       : StepState.disabled,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime? _time;
    DateTime? _pickedDate = DateTime.now();

    return GetBuilder<RequestMeetController>(
      init: RequestMeetController(),
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();

                  DateTime? _time = (await showDatePicker(
                      context: context,
                      initialDate: _pickedDate,
                      firstDate: DateTime(DateTime.now().year - 100),
                      // builder: (context, text) =>
                      //     Text("${text?.toStringDeep()}"),
                      lastDate: DateTime(DateTime.now().year + 5)));

                  controller.selectStartTime(_time, _pickedDate);
                },
                child: Row(
                  children: [
                    Text(
                      controller.text,
                      style: heading2(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: heading2(context).height,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.date_range,
                size: heading2(context).height,
                color: AppColors.primaryColor,
              )
            ],
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.timeItems.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => controller.onChanged(index),
                child: TimePill(
                  title: "${controller.pickedDates!.day + 1}",
                  isSelected: controller.selected == index,
                  subtitle: "${controller.pickedDates!.year}",
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(

                // border: Border.all(width: 2.0, color: Colors.black),
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle),
            child: AnalogClock(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              isLive: true,
              hourHandColor: AppColors.light,
              minuteHandColor: AppColors.light,
              showSecondHand: true,
              numberColor: AppColors.light,
              showNumbers: true,
              showAllNumbers: true,
              textScaleFactor: 1.5,
              showTicks: false,
              showDigitalClock: true,
              digitalClockColor: AppColors.light,
              datetime: DateTime(2019, 1, 1, 9, 12, 15),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          AppButton(
            label: "Proceed to Location",
            onPressed: () => controller.continued(),
          )
        ],
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
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
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "See Directions",
                            style: bodyText1(context).copyWith(
                              color: AppColors.light,
                            ),
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
    return GetBuilder<RequestMeetController>(
        init: RequestMeetController(),
        builder: (controller) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        // flex: 2,
                        child: AppSearchTextField(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search for places to meet your friend",
                        ),
                      ),
                      const Spacing.tinyWidth(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.primaryColor, width: 2),
                            color: Colors.grey.shade200),
                        child: const Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  const Spacing.largeHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Places close to you",
                        style: bodyText2(context),
                      ),
                      const Spacing.tinyWidth(),
                      Text(
                        "Click to select/Unselect",
                        style: bodyText2(context),
                      ),
                    ],
                  ),
                  const Spacing.mediumHeight(),
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      aspectRatio: 1.8,
                      initialPage: 0,
                      // onPageChanged: (index, _) => context
                      //     .read(dashboardScreenNotifier)
                      //     .visibleCarousel(index)),
                    ),
                  ),
                  const Spacing.largeHeight(),
                  Text(
                    "Recently Visited",
                    style: bodyText2(context),
                  ),
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => imageGrid(context)),
                  ),
                  AppButton(
                    label: "Proceed to Location",
                    // onPressed: () => Get.to(() => const DirectionsScreen()),
                    onPressed: () => controller.continued(),
                  )
                ],
              ),
            ));
  }

  Widget imageGrid(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(
            top: Dimensions.medium,
            right: Dimensions.medium,
            bottom: Dimensions.medium,
          ),
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
          height: 100,
          width: MediaQuery.of(context).size.width / 2,
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(
            // top: Dimensions.medium,
            right: Dimensions.medium,
            bottom: Dimensions.medium,
          ),
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
          height: 100,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ],
    );
  }
}

class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestMeetController>(
      init: RequestMeetController(),
      builder: (controller) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Spacer(),
            AppButton(
              label: "Proceed to Location",
              // onPressed: () => Get.to(() => const DirectionsScreen()),
              onPressed: () => controller.continued(),
            )
          ],
        ),
      ),
    );
  }
}
