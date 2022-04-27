import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget lowerMobile;
  final Widget mobile;
  final Widget tablet;

  const Responsive(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.lowerMobile})
      : super(key: key);

  static double lowerMobileMaxWidth = 280;

  static double mobileMaxWidth = 480;
  static double tabletMaxWidth = 768;

  static bool isLowerMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < lowerMobileMaxWidth ||
      MediaQuery.of(context).size.width <= mobileMaxWidth;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMaxWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletMaxWidth &&
      MediaQuery.of(context).size.width >= mobileMaxWidth;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= mobileMaxWidth && _size.width < tabletMaxWidth) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
