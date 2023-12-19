import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_indicator.dart';
import 'package:cvcar_mobile/app/modules/reservations/views/reservations_view.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/vehicle_cv_controller.dart';

class VehicleCvView extends GetView<VehicleCvController> {
  const VehicleCvView({Key? key}) : super(key: key);
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/categories/CVdelvehiculodetalles.png",
                  width: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Label(label: "CV del vehículo", sizeFont: 16.h),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Obx(
                  () => SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: Checkbox(
                          activeColor: Color(CVCarColors.primaryColor),
                          value: controller.isExpanded.value,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            controller.isExpanded.value = value!;
                          })),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Description(
                  label: "Desplegar todas las pestañas",
                  sizeFont: 13.h,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            ShrinkCard(
              title: "Kilometraje",
              edit: true,
            ),
            ShrinkCard(
              title: "Combustible",
              edit: false,
            ),
            ShrinkCard(
              title: "Lavados",
              edit: false,
            ),
            ShrinkCard(
              title: "Mantenimiento general",
              edit: false,
            ),
            ShrinkCard(
              title: "Cambio de aceite",
              edit: false,
            ),
            ShrinkCard(
              title: "SOAT",
              edit: false,
              indicator: const CustomIndicator(
                isActive: true,
                status: "Vigente",
              ),
            ),
            ShrinkCard(
              title: "Tecnomecánica",
              edit: false,
              indicator: const CustomIndicator(
                isActive: true,
                status: "Vigente",
              ),
            ),
            ShrinkCard(
              title: "Impuestos",
              edit: false,
              indicator: const CustomIndicator(
                isActive: true,
                status: "Vigente",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(CVCarColors.primaryColor),
      ),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(14),
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                      label: "50% en lavado básico de carro",
                      fontcolor: Colors.white,
                      sizeFont: 12.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        const Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataFormat(
                        imagePath: "assets/informative/usuario.png",
                        label: "Auto spa detailing"),
                    DataFormat(
                        imagePath: "assets/informative/location-sharp.png",
                        label: "Cra 56 # 47 9"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataFormat(
                        imagePath: "assets/informative/calendar-fill.png",
                        label: "30/10/23"),
                    DataFormat(
                        imagePath: "assets/informative/clock-fill.png",
                        label: "8:00 AM -10:00 AM"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 25.h,
            width: double.infinity,
            color: Color(CVCarColors.grey).withOpacity(0.3),
            child: Center(
              child: Description(
                label: "Cancelar reserva",
                color: Colors.white,
                sizeFont: 9.sp,
              ),
            ))
      ]),
    );
  }
}

class ShrinkCard extends StatelessWidget {
  const ShrinkCard({
    Key? key,
    required this.title,
    required this.edit,
    this.indicator,
  }) : super(key: key);

  final String title;
  final bool edit;
  final Widget? indicator;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(CVCarColors.primaryColor),
          ),
          padding: EdgeInsets.all(14),
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                      label: title,
                      fontcolor: Colors.white,
                      sizeFont: 15.sp,
                    ),
                    Expanded(child: SizedBox()),
                    indicator ??
                        Container(
                          width: 20.h,
                          height: 20.h,
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
                                    size: 20,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
