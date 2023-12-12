import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/global/custom_dropdown_form_field.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                CustomDropdownFormField(
                  width: 200.w,
                  items: controller.availableVehicles,
                  hint: 'Tipo de documento',
                  enableBorder: false,
                  onChanged: (value) {
                    controller.vehiclesAssigned.value.text = value.toString();
                  },
                  value: controller.vehiclesAssigned.value.text.isNotEmpty
                      ? controller.vehiclesAssigned.value.text
                      : null,
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/web/livianos.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Description(
                    label: 'Ver todas las promociones >',
                    sizeFont: 7.5.h,
                    textAlign: TextAlign.center,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
