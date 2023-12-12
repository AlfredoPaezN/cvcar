import 'package:cvcar_mobile/app/modules/app_navigation/widget/bottom_navbar_style.dart';
import 'package:cvcar_mobile/app/routes/app_menu.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/app_navigation_controller.dart';

class AppNavigationView extends GetView<AppNavigationController> {
  const AppNavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreen() {
      return menuBuildScreens();
    }

    List<PersistentBottomNavBarItem> navBarItems() {
      return navBarsItems();
    }

    return Scaffold(
        bottomNavigationBar: Container(
          height: 30.h,
          color: Color(CVCarColors.primaryColor),
        ),
        body: Obx(
          () => PersistentTabView.custom(
            context,
            backgroundColor: Color(CVCarColors.backgroundColor),
            controller: controller.tabController,
            itemCount: navBarItems().length,
            screens: buildScreen(),
            onWillPop: (context) async {
              return true;
            },
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
            ),
            customWidget: CustomNavBarWidget(
              items: navBarItems(),
              selectedIndex: controller.pageIndexSelected.value,
              onItemSelected: (index) {
                controller.tabController.index = index;
                controller.pageIndexSelected.value = index;
                print("INDEX SELECTED: $index ${navBarItems()[index].title}");
                controller.currentPageName.value =
                    navBarItems()[index].title ?? "";
              },
            ),
          ),
        ));
  }
}
