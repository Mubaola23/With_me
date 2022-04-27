import 'package:flutter/material.dart';
import 'package:with_me/src/core/constants/colors.dart';

import '../../widgets/responssive.dart';

double responsive4(BuildContext context) =>
    MediaQuery.of(context).size.width / 38;

double responsive6(BuildContext context) =>
    MediaQuery.of(context).size.width / 36;

double responsive8(BuildContext context) =>
    MediaQuery.of(context).size.width / 34;

double responsive10(BuildContext context) =>
    MediaQuery.of(context).size.width / 32;

double responsive12(BuildContext context) =>
    MediaQuery.of(context).size.width / 30;

double responsive14(BuildContext context) =>
    MediaQuery.of(context).size.width / 28;

double responsive16(BuildContext context) =>
    MediaQuery.of(context).size.width / 26;

double responsive18(BuildContext context) =>
    MediaQuery.of(context).size.width / 24;

double responsive20(BuildContext context) =>
    MediaQuery.of(context).size.width / 22;

double responsive22(BuildContext context) =>
    MediaQuery.of(context).size.width / 20;

double responsive24(BuildContext context) =>
    MediaQuery.of(context).size.width / 18;

double responsive26(BuildContext context) =>
    MediaQuery.of(context).size.width / 16;

double responsive28(BuildContext context) =>
    MediaQuery.of(context).size.width / 14;

double responsive30(BuildContext context) =>
    MediaQuery.of(context).size.width / 12;

double responsive32(BuildContext context) =>
    MediaQuery.of(context).size.width / 10;

double responsive36(BuildContext context) =>
    MediaQuery.of(context).size.width / 6;

double responsive38(BuildContext context) =>
    MediaQuery.of(context).size.width / 4;

double responsive50(BuildContext context) =>
    MediaQuery.of(context).size.width / 10;

double responsive120(BuildContext context) =>
    MediaQuery.of(context).size.width / 10;
double responsive100(BuildContext context) =>
    MediaQuery.of(context).size.width / 5;

/// App TextStyles

TextStyle heading1(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: responsive50(context),
      fontWeight: FontWeight.w600,
    );

TextStyle heading2(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: Responsive.isLowerMobile(context) ? responsive24(context) : 34,
      fontWeight: FontWeight.w600,
    );

// TextStyle heading3(BuildContext context) => TextStyle(

//       color: AppColors.dark,
//       fontSize: Responsive.isMobile(context) ? responsive26(context) : 36,
//       fontWeight: FontWeight.w400,
//     );

TextStyle heading4(BuildContext context) => TextStyle(
      fontSize: Responsive.isLowerMobile(context) ? responsive18(context) : 20,
      fontWeight: FontWeight.w400,
    );

TextStyle bodyText1(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: Responsive.isLowerMobile(context) ? responsive12(context) : 18,
      fontWeight: FontWeight.w400,
    );

TextStyle bodyText2(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: Responsive.isLowerMobile(context) ? responsive10(context) : 16,
      fontWeight: FontWeight.w300,
    );
