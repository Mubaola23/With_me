import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:with_me/src/core/constants/app_textstyles.dart';
import 'package:with_me/src/core/constants/colors.dart';
import 'package:with_me/src/core/constants/dimensions.dart';
import 'package:with_me/src/widgets/app_button.dart';
import 'package:with_me/src/widgets/spacing.dart';
import 'package:with_me/src/widgets/status_bar.dart';

class MeetRequestDetails extends StatelessWidget {
  final String date;
  final String img;
  final String time;
  final String name;
  final String location;

  const MeetRequestDetails(
      {Key? key,
      required this.date,
      required this.img,
      required this.time,
      required this.name,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.big,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacing.bigHeight(),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.grey, width: 4),
                      ),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 4,
                        backgroundImage: AssetImage(img),
                      ),
                    ),
                    const Spacing.mediumHeight(),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: heading2(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    Text(
                      "7 Minutes Away",
                      textAlign: TextAlign.center,
                      style: heading4(context),
                    ),
                    MeetTile(
                        title: date,
                        subtitle: "Ask to Reschedule",
                        label: "Date",
                        icon: Icons.refresh),
                    MeetTile(
                        title: time,
                        subtitle: "Add to Calendar",
                        label: "Meet time",
                        icon: Icons.calendar_today_outlined),
                    MeetTile(
                        title: location,
                        subtitle: "Suggest location change",
                        label: "Location",
                        icon: Icons.location_on),
                    const Spacing.bigHeight(),
                    AppButton(
                      label: "Accept Request",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  insetPadding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                  ),
                                  child: Container(
                                    // height: 100,
                                    // width: 100,
                                    padding: EdgeInsets.all(24),
                                    color: AppColors.light,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.check_circle,
                                          size: 100,
                                          color: AppColors.primaryColor,
                                        ),
                                        Text(
                                          "Your Meet has been scheduled",
                                          style: heading4(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Ignore",
                          style: heading4(context),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MeetTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String label;
  final IconData icon;

  const MeetTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.big),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(label),
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.end,
                      softWrap: true,
                      style: heading4(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              icon,
                              color: AppColors.primaryColor,
                              size: heading4(context).height,
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                subtitle,
                                // softWrap: false,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
