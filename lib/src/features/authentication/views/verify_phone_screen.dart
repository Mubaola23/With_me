import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
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
                    "Verify Phone Number",
                    style: heading2(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Spacing.tinyHeight(),
                  Text(
                    "Please input the verification code sent to your SMS",
                    style: heading4(context),
                  ),
                  const Spacing.bigHeight(),
                  Text(
                    "Verification code:",
                    style:
                        heading4(context).copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacing.smallHeight(),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: Dimensions.big),
                    // padding: EdgeInsets.symmetric(horizontal: Dimensions.medium),
                    child: OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: MediaQuery.of(context).size.width / 6,
                      style: const TextStyle(fontSize: 18),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onChanged: (pin) {
                        // changepinNotifier.otpCompleted(pin);
                        print('process: ' + pin);
                      },
                      otpFieldStyle:
                          OtpFieldStyle(backgroundColor: AppColors.light),
                      onCompleted: (cpin) {
                        // changepinNotifier.completeOtp = cpin;
                        print('Completed: ' + cpin);
                      },
                    ),
                  ),
                  const Spacing.largeHeight(),
                  AppButton(
                    label: "Verify",
                    onPressed: () => Get.offNamed('/preferenceScreen'),
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
