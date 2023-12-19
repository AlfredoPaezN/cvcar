import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/vehicle_detail_controller.dart';

class VehicleDetailView extends GetView<VehicleDetailController> {
  const VehicleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(CVCarColors.primaryColor),
            title: FadeInLeft(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/logo/isotipo_color.png',
                    width: 40.h,
                  ),
                ],
              ),
            )),
        body: ListView(
          padding: const EdgeInsets.all(25.0),
          children: [
            VehicleDetail(controller: controller),
            SizedBox(
              height: 20.h,
            ),
            LicenseDetail(controller: controller),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(CVCarColors.secondaryColor),
                  width: 1.5,
                ),
                color: Color(CVCarColors.primaryColor),
              ),
              child: CustomButton(
                label: "Eliminar vehículo",
                color: Color(CVCarColors.backgroundColor),
                action: () {},
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ));
  }
}

class LicenseDetail extends StatelessWidget {
  const LicenseDetail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VehicleDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/categories/impuestos.png",
                width: 30.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Label(label: "Detalles de la licencia", sizeFont: 16.h),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(CVCarColors.primaryColor),
            ),
            child: Column(children: [
              // for (var entry in controller.exampleLicense.toJson().entries)
              //   Padding(
              //     padding: EdgeInsets.symmetric(vertical: 4.0.h),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Description(
              //           label: entry.key,
              //           sizeFont: 11.h,
              //           color: Color(CVCarColors.greyLight),
              //           // color: Colors.white,
              //         ),
              //         Label(
              //           label: entry.value,
              //           sizeFont: 11.h,
              //           // color: Colors.white,
              //         ),
              //       ],
              //     ),
              //   ),
            ]),
          ),
        ],
      ),
    );
  }
}

class VehicleDetail extends StatelessWidget {
  const VehicleDetail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VehicleDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/categories/detallesdevehiculo.png",
                width: 30.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Label(label: "Detalles del vehículo", sizeFont: 16.h),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(CVCarColors.primaryColor),
            ),
            child: Column(children: [
              // for (var entry in controller.exampleData.toJson().entries)
              //   Padding(
              //     padding: EdgeInsets.symmetric(vertical: 4.0.h),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Description(
              //           label: entry.key,
              //           sizeFont: 11.h,
              //           color: Color(CVCarColors.greyLight),
              //           // color: Colors.white,
              //         ),
              //         Label(
              //           label: entry.value,
              //           sizeFont: 11.h,
              //           // color: Colors.white,
              //         ),
              //       ],
              //     ),
              //   ),
            ]),
          ),
        ],
      ),
    );
  }
}
