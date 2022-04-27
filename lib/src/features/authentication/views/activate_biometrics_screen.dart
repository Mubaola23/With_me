import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/core/constants/app_textstyles.dart';
import 'package:with_me/src/core/constants/colors.dart';
import 'package:with_me/src/widgets/spacing.dart';
import 'package:with_me/src/widgets/status_bar.dart';

class ActivateBiometricsScreen extends StatelessWidget {
  const ActivateBiometricsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                AppImages.fingerprint2,
                // color: AppColors.primaryColor,
              ),
            ),
            const Spacing.largeHeight(),
            TextButton(
              onPressed: () => Get.offAllNamed("/phoneNumber"),
              child: Text(
                "Skip, I’ll do it later",
                style: bodyText2(context).copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.light,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
