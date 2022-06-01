import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/routes.dart';
import 'package:with_me/src/widgets/app_button.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../widgets/spacing.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.big, vertical: Dimensions.big),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verification Sent",
                    style: heading2(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  // Text(
                  //   "Verify Phone Number",
                  //   style: heading2(context)
                  //       .copyWith(color: AppColors.primaryColor),
                  // ),
                  const Spacing.tinyHeight(),
                  Text(
                    'A verification link has been sent to your email.'
                    ' Please confirm that you want to use this as your account email address.',
                    style: heading4(context),
                  ),
                  // Text(
                  //       "Please input the verification code sent to your SMS",
                  //       style: heading4(context),
                  //     ),
                  //
                  const Spacing.bigHeight(),
                  // Text(
                  //   "Verification code:",
                  //   style:
                  //       heading4(context).copyWith(fontWeight: FontWeight.bold),
                  // ),
                  // const Spacing.smallHeight(),
                  // Container(
                  //   margin:
                  //       const EdgeInsets.symmetric(vertical: Dimensions.big),
                  //   // padding: EdgeInsets.symmetric(horizontal: Dimensions.medium),
                  //   child: OTPTextField(
                  //     length: 4,
                  //     width: MediaQuery.of(context).size.width,
                  //     fieldWidth: MediaQuery.of(context).size.width / 6,
                  //     style: const TextStyle(fontSize: 18),
                  //     textFieldAlignment: MainAxisAlignment.spaceAround,
                  //     fieldStyle: FieldStyle.box,
                  //     onChanged: (pin) {
                  //       // changepinNotifier.otpCompleted(pin);
                  //       print('process: ' + pin);
                  //     },
                  //     otpFieldStyle:
                  //         OtpFieldStyle(backgroundColor: AppColors.light),
                  //     onCompleted: (cpin) {
                  //       // changepinNotifier.completeOtp = cpin;
                  //       print('Completed: ' + cpin);
                  //     },
                  //   ),
                  // ),
                  const Spacing.largeHeight(),
                  AppButton(
                    label: "Proceed",
                    onPressed: () => Get.offNamed(Routes.login),
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
