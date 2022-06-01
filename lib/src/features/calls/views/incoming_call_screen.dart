import 'package:flutter/material.dart';
import 'package:with_me/src/widgets/spacing.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';

class IncomingCallScreen extends StatelessWidget {
  const IncomingCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: const EdgeInsets.symmetric(
                  //     vertical: 20, horizontal: Dimensions.big),
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
                const Spacing.smallHeight(),
                Text(
                  "Daniel Umeh",
                  textAlign: TextAlign.center,
                  style: heading2(context).copyWith(color: AppColors.light),
                ),
                Text(
                  "7 Minutes Away",
                  textAlign: TextAlign.center,
                  style: heading4(context).copyWith(color: AppColors.light),
                ),
                const Spacing.mediumHeight(),
                Text(
                  "Ringing...",
                  textAlign: TextAlign.center,
                  style: heading4(context).copyWith(color: AppColors.light),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.light,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.call_end_outlined,
                    color: Colors.red,
                  ),
                ),
                const Spacing.bigHeight(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
