import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/widgets/app_button.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../widgets/app_textfield.dart';
import '../../../widgets/spacing.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.big, vertical: Dimensions.large),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify Phone Number",
                    style: heading2(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Spacing.tinyHeight(),
                  Text(
                    "We’d like your friends to find you easy and fast.",
                    style: heading4(context),
                  ),
                  const Spacing.bigHeight(),
                  Text(
                    "Activate Phone Number:",
                    style:
                        heading4(context).copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacing.smallHeight(),
                  const AppTextField(
                    hintText: "+234 ",
                    label: "Phone Number",
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  const Spacing.largeHeight(),
                  AppButton(
                    label: "Verify",
                    onPressed: () => Get.offAndToNamed("/verifyPhone"),
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
