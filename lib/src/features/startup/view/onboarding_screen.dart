import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/core/constants/colors.dart';
import 'package:with_me/src/core/constants/dimensions.dart';
import 'package:with_me/src/services/startup_service.dart';
import 'package:with_me/src/widgets/app_button.dart';
import 'package:with_me/src/widgets/spacing.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../controller/onboarding_controller.dart';
import '../model/onboarding_column.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  List<Widget> _buildPageIndicator(OnboardingController controller) {
    List<Widget> list = [];
    for (int i = 0; i < controller.numPages; i++) {
      list.add(
          i == controller.currentIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.grey[500],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.white),
      ),
    );
  }

  final List<OnboardingColumn> onboardingPages = <OnboardingColumn>[
    const OnboardingColumn(
      imgPath: AppImages.onboardind1,
      titletext: 'Create a specialized profile with all your prefrences',
    ),
    const OnboardingColumn(
      imgPath: AppImages.onboardind2,
      titletext: 'Find and connect with friends close by',
    ),
    const OnboardingColumn(
      imgPath: AppImages.onboardind3,
      titletext: 'Accept, schedule and plan meets on voice calls',
    ),
  ];
  //  const OnboardingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          builder: (controller) => Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Expanded(
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.onChangedFunction,
                  children: onboardingPages,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(controller),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: Dimensions.extraLarge),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.extraLarge,
                          vertical: Dimensions.extraLarge),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        children: [
                          SizedBox(
                            child: AppButton(
                              label: "Get Started",
                              onPressed: () async {
                                await GetStorage()
                                    .write("onboardingViewed", true);
                                Get.offAllNamed("/signup");
                              },
                            ),
                            width: 200,
                          ),
                          const Spacing.bigHeight(),
                          Text.rich(
                            TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          await Get.find<StartupService>()
                                              .writeOnboardingViewed();

                                          Get.offAllNamed("/login");
                                        },
                                      text: "Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: AppColors.primaryColor))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
