/*
 * This project was built for Trinipicks by :
 *
 * https://github.com/mubaola23
 * https://github.com/toyyibat1
 *
 * SideHustle
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:with_me/src/core/constants/colors.dart';

class TimePill extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;

  const TimePill(
      {this.isSelected = false, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 7,
        height: MediaQuery.of(context).size.width / .4,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0.9),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : null,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: isSelected ? AppColors.light : AppColors.dark),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  color: isSelected ? AppColors.light : AppColors.dark),
            )
          ],
        ));
  }
}
