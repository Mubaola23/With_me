import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/constants/app_images.dart';
import 'package:with_me/src/widgets/app_button.dart';
import 'package:with_me/src/widgets/spacing.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import 'meet_request_details.dart';

class RequestDisplayScreen extends StatelessWidget {
  const RequestDisplayScreen({Key? key}) : super(key: key);

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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.big),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: Dimensions.big),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Colors.grey, width: 4),
                        ),
                        child: const CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(AppImages.demo),
                        ),
                      ),
                      Text(
                        "Daniel Umeh is sending you a meet request!",
                        textAlign: TextAlign.center,
                        style:
                            heading2(context).copyWith(color: AppColors.light),
                      ),
                      const Spacing.bigHeight(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: AppButton1(
                            label: "See Details",
                            onPressed: () => Get.to(() => const MeetRequestDetails(
                                date: "7th October 2022",
                                img: AppImages.demo,
                                time: "8:00 pm",
                                name: "Mubarak Shuaib Olasunkanmi",
                                location:
                                    " 4517 Washington Ave. Manchester, Kentucky 39495")),
                          )),
                          Spacer(),
                          Expanded(
                              child: AppButton1(
                                  label: "Voice Call", onPressed: () {})),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
