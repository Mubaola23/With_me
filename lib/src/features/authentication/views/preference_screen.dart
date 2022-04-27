import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/constants/app_images.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/status_bar.dart';

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _gridItems = [
      AppImages.travel,
      AppImages.cars,
      AppImages.music,
      AppImages.beauty,
      AppImages.health,
      AppImages.movies,
      AppImages.pets,
      AppImages.food,
      AppImages.tech,
      AppImages.fashion,
      AppImages.fitness,
    ];
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.big, vertical: Dimensions.big),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tell us what you like",
                    style: heading2(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Spacing.tinyHeight(),
                  Text(
                    "Choose your preferences below ",
                    style: heading4(context),
                  ),
                  const Spacing.bigHeight(),
                  GridView.builder(
                    itemCount: _gridItems.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      // childAspectRatio: Responsive.isMobile(context)
                      //     ? 9.5 / 8
                      //     : Responsive.isLowerMobile(context)
                      //         ? 7 / 4
                      //         : 7 / 4,
                      mainAxisSpacing: Dimensions.big,
                      crossAxisSpacing: Dimensions.big,
                    ),
                    itemBuilder: (context, index) {
                      return SvgPicture.asset(
                        _gridItems[index],
                      );
                    },
                  ),
                  const Spacing.bigHeight(),
                  AppButton(
                    label: "Save",
                    onPressed: () {},
                  ),
                  const Spacing.bigHeight(),
                  TextButton(
                    onPressed: () => Get.offAllNamed("/home"),
                    child: Text(
                      "Skip, I’ll do it later",
                      style: heading2(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
