import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/widgets/app_button.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class CloseAlertScreen extends StatelessWidget {
  const CloseAlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimensions.big),
                  child: IconButton(
                    icon: const Icon(
                      Icons.dangerous,
                      size: 60,
                      color: AppColors.light,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
            preferredSize: Size(10, 100),
          ),
          backgroundColor: AppColors.primaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: Dimensions.big),
                child: IconButton(
                  icon: const Icon(
                    Icons.dangerous,
                    size: 60,
                    color: AppColors.light,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Daniel Umeh is close by!",
                      style: heading2(context).copyWith(color: AppColors.light),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(Dimensions.big),
                          child: AppButton1(
                            label: "Request A Meet",
                            onPressed: () => Get.toNamed("/requestMeet1"),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(Dimensions.big),
                          child:
                              AppButton1(label: "Voice Call", onPressed: () {}),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
