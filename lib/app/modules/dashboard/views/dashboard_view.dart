import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_indicator.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // padding: const EdgeInsets.all(25.0),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 25, right: 25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: GestureDetector(
              onTap: () {
                // Get.toNamed(Routes.VEHICLE_DETAIL);
              },
              child: Image.asset(
                'assets/web/promo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Row(
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
        ),
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              OptionShort(
                label: 'CV del vehículo',
                imagePath: "assets/informative/vehiculo.png",
                onTap: () {
                  Get.toNamed(Routes.VEHICLE_CV);
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              OptionShort(
                label: 'Detalles del vehículo',
                imagePath: "assets/informative/detalles del vehículo.png",
                onTap: () {
                  GetStorage box = GetStorage();
                  final token = box.read("access_token");
                  print("token: $token");
                  Get.toNamed(Routes.VEHICLE_DETAIL);
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(children: [
            Expanded(
              child: OptionWithBody(
                  label: 'Kilometraje',
                  edit: true,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Label(
                          label: '0 km',
                          fontcolor: Colors.white,
                          sizeFont: 20.sp),
                      SizedBox(
                        height: 8.h,
                      ),
                      Label(
                          label: '12/12/2021',
                          fontcolor: Colors.white,
                          sizeFont: 10.sp),
                      Description(
                        label: "Último registro",
                        sizeFont: 7.5.sp,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: OptionWithBody(
                  label: 'Kilometraje',
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/categories/monetizacion.png'),
                      SizedBox(
                        height: 8.h,
                      ),
                      Description(
                        label: "Costos diarios",
                        sizeFont: 9.sp,
                        color: Colors.white,
                      ),
                      Description(
                        label: "Costos Mensuales",
                        sizeFont: 9.sp,
                        color: Colors.white,
                      ),
                      Label(
                        label: 'Costos Anuales',
                        fontcolor: Colors.white,
                        sizeFont: 9.sp,
                      ),
                    ],
                  )),
            ),
          ]),
        ),
        SizedBox(
          height: 18.h,
        ),
        FadeInRight(
          child: SizedBox(
            height: 120.h,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 25 : 8.w),
                  child: Container(
                    width: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      // color: Colors.brown,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 90.h,
                            height: 104.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(CVCarColors.primaryColor),
                            ),
                            child: Column(children: [
                              Expanded(child: SizedBox()),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Label(
                                      label: controller.categories[index]
                                          ['title']!,
                                      fontcolor: Colors.white,
                                      sizeFont: 15.sp),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: CustomIndicator(
                                    isActive: controller.categories[index]
                                            ['status'] ==
                                        "Vigente",
                                    status: controller.categories[index]
                                        ['status']!,
                                  )),
                            ]),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 27.5.h,
                            child: Image.asset(
                              controller.categories[index]['image']!,
                            ),
                            width: 35.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.label,
    required this.description,
  }) : super(key: key);

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Description(
          label: label,
          sizeFont: 10.sp,
          color: Colors.white,
        ),
        Expanded(child: SizedBox()),
        Label(label: description, fontcolor: Colors.white, sizeFont: 10.sp),
      ],
    );
  }
}

class OptionWithBody extends StatelessWidget {
  const OptionWithBody({
    Key? key,
    required this.label,
    required this.body,
    this.edit = false,
  }) : super(key: key);

  final String label;
  final Widget body;
  final bool edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(CVCarColors.primaryColor),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                  label: label,
                  // fontcolor: Colors.black,
                  sizeFont: 10.sp),
              const Expanded(child: SizedBox()),
              Container(
                width: 15.h,
                height: 15.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(4),
                  color: Color(CVCarColors.greyLight),
                ),
                child: Center(
                  child: edit
                      ? const Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          body,
        ],
      ),
    );
  }
}

class OptionShort extends StatelessWidget {
  const OptionShort({
    Key? key,
    required this.label,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final String imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(CVCarColors.primaryColor),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 13.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Label(label: label, fontcolor: Colors.white, sizeFont: 10.sp),
            ],
          )),
        ),
      ),
    );
  }
}
