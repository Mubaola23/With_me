import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_me/src/core/constants/dimensions.dart';
import 'package:with_me/src/features/meets/views/request_display_screen.dart';
import 'package:with_me/src/widgets/status_bar.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_textstyles.dart';
import '../../../core/constants/colors.dart';

class MeetsScreen extends StatefulWidget {
  const MeetsScreen({Key? key}) : super(key: key);

  @override
  State<MeetsScreen> createState() => _MeetsScreenState();
}

class _MeetsScreenState extends State<MeetsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? _currentIndex = 0;
  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController?.index;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: AppColors.light,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          appBar: PreferredSize(
            preferredSize: const Size(100, 120),
            child: Container(
              padding: const EdgeInsets.only(
                  left: Dimensions.big,
                  top: Dimensions.big,
                  right: Dimensions.big),
              color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Meets",
                      style:
                          heading2(context).copyWith(color: AppColors.light)),
                  // const Spacing.largeHeight(),
                  Spacer(),
                  TabBar(
                    // indicatorSize: TabBarIndicatorSize.values[],
                    isScrollable: false,
                    indicatorColor: AppColors.light,
                    controller: _tabController,
                    labelPadding: EdgeInsets.only(bottom: 13, top: 16),
                    tabs: [
                      Text(
                        "Upcoming",
                        style:
                            heading2(context).copyWith(color: AppColors.light),
                      ),
                      Text(
                        "Requests",
                        style:
                            heading2(context).copyWith(color: AppColors.light),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // AppBar(
          //   title: Text("Request Meet",
          //       style: heading2(context).copyWith(color: AppColors.light)),
          // ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [upcoming(context), request(context)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  upcoming(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.big, vertical: Dimensions.big),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today"),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: Dimensions.small),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        color: const Color(0xfffa9a9a9),
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                      AppImages.demo,
                      // height: 20,
                    ),
                  ),
                  title: const Text(
                    "Cameron Williamson",
                  ),
                  subtitle: Flexible(
                    flex: 1,
                    child: Row(
                      children: const [
                        Text(
                          "February 29, 2012 ",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        Text("● 6 hours away")
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: responsive20(context),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  request(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.big, vertical: Dimensions.big),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today"),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: Dimensions.small),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        color: const Color(0xfffa9a9a9),
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: ListTile(
                  onTap: () => Get.to(() => const RequestDisplayScreen()),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                      AppImages.demo,
                      // height: 20,
                    ),
                  ),
                  title: const Text(
                    "Cameron Williamson",
                  ),
                  subtitle: Row(
                    children: const [
                      Text(
                        "February 29, 2012 ",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      Text("● 6 hours away")
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: responsive20(context),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
