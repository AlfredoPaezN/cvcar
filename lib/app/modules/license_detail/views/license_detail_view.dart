import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/modules/vehicle_detail/views/vehicle_detail_view.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/license_detail_controller.dart';

class LicenseDetailView extends GetView<LicenseDetailController> {
  const LicenseDetailView({Key? key}) : super(key: key);
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
      body: LicenseDetail(controller: controller),
    );
  }
}

class LicenseDetail extends StatelessWidget {
  const LicenseDetail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LicenseDetailController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(25.0),
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
            TileInfo(
              label: "Nombre",
              description:
                  "${controller.authController.userData.value?.firstName}  ${(controller.authController.userData.value?.lastName?.length ?? 0) > 10 ? controller.authController.userData.value?.lastName?.substring(0, 10) ?? "" : controller.authController.userData.value?.lastName}",
            ),
            TileInfo(
              label: "No de licencia",
              description: controller.authController.drivinData.value
                  ?.licences?[0].licenceDrivingNumber,
            ),
            TileInfo(
              label: "Categoria",
              description: controller.authController.drivinData.value
                  ?.licences?[0].details?[0].drivingCategory?.name,
            ),
            TileInfo(
              label: "Fecha de expedición",
              description: controller.authController.drivinData.value
                  ?.licences?[0].details?[0].dateExpedition
                  .toString()
                  .substring(0, 10),
            ),
            TileInfo(
              label: "Fecha de vencimiento",
              description: controller.authController.drivinData.value
                  ?.licences?[0].details?[0].dateExpiration
                  .toString()
                  .substring(0, 10),
            ),
          ]),
        ),
      ],
    );
  }
}
