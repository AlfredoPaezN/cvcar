import 'package:cvcar_mobile/app/global/custom_dropdown_form_field.dart';
import 'package:cvcar_mobile/app/modules/app_navigation/widget/bottom_navbar_style.dart';
import 'package:cvcar_mobile/app/routes/app_menu.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50.h,
          backgroundColor: Color(CVCarColors.primaryColor),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo/isotipo_color.png',
                  width: 40.h,
                ),
                Obx(
                  () => CustomDropdownFormField(
                    width: 200.w,
                    items: controller.availableVehicles,
                    // hint: 'Tipo de documento',
                    enableBorder: false,
                    onChanged: (value) {
                      if (value == '+ Agregar nuevo vehículo') {
                        Get.toNamed(Routes.REGISTER_VEHICLE);
                      } else {
                        controller.vehiclesAssigned.value.text =
                            value.toString();
                      }
                    },

                    value: controller.vehiclesAssigned.value.text.isNotEmpty
                        ? controller.vehiclesAssigned.value.text
                        : controller.availableVehicles.first.value,
                  ),
                )
              ],
            ),
          ),
        ),
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
