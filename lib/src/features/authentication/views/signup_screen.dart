import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/core/constants/app_textstyles.dart';
import 'package:with_me/src/core/constants/colors.dart';
import 'package:with_me/src/core/constants/dimensions.dart';
import 'package:with_me/src/features/authentication/controller/signup_controller.dart';
import 'package:with_me/src/widgets/app_textfield.dart';
import 'package:with_me/src/widgets/spacing.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../widgets/app_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
        child: SafeArea(
      child: GetBuilder<SignUpController>(
          init: SignUpController(),
          builder: (controller) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.big, vertical: Dimensions.big),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to WithMe!",
                        style: heading2(context)
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      const Spacing.tinyHeight(),
                      Text(
                        "Create your account to start connecting with closeby friends.",
                        style: heading4(context),
                      ),
                      const Spacing.bigHeight(),
                      signUpWith(context,
                          img: AppImages.gmail, text: "Login With Gmail"),
                      const Spacing.mediumHeight(),
                      signUpWith(context,
                          img: AppImages.gmail, text: "Login With Facebook"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.large),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColors.dark,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "OR",
                                style: TextStyle(color: AppColors.dark),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColors.dark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const AppTextField(
                        hintText: "abcd@gmail.com",
                        label: "Email",
                        prefixIcon: Icon(Icons.alternate_email),
                        // title: "khkb,jk",
                      ),
                      AppTextField(
                        hintText: "*******8",
                        label: "Password",
                        obscureText: controller.visibility,
                        prefixIcon: const Icon(
                          Icons.shield,
                          // title: "khkb,jk",
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.visibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,

                            // title: "khkb,jk",
                          ),
                          onPressed: () => controller.onChange(),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.primaryColor,
                            onChanged: (val) => controller.onChangeBox(),
                            value: controller.checkBox,
                          ),
                          const Text("I agree with the terms and  conditions"),
                        ],
                      ),
                      const Spacing.largeHeight(),
                      Column(
                        children: [
                          AppButton(
                              label: "Sign Up",
                              onPressed: () {
                                Get.offAllNamed("/activateBiometrics");
                              }),
                          const Spacing.bigHeight(),
                          Text.rich(
                            TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
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
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }

  Widget signUpWith(BuildContext context,
      {required String img, required String text}) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.big,
            ),
            child: Text(
              text,
              style: heading4(context).copyWith(color: AppColors.primaryColor),
            ),
          ),
          SvgPicture.asset(
            img,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
