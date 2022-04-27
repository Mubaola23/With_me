import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:with_me/src/core/constants/app_textstyles.dart';

class OnboardingColumn extends StatelessWidget {
  final String? imgPath;
  final String? titletext;

  const OnboardingColumn({
    this.imgPath,
    this.titletext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.fromLTRB(30, 128, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: responsive50(context)),
          SvgPicture.asset(
            imgPath!,
            width: MediaQuery.of(context).size.height / 3,
          ),
          const Spacer(),
          Text(titletext!),
          SizedBox(height: responsive20(context)),
        ],
      ),
    );
  }
}
