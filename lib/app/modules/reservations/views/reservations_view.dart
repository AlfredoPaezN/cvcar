import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_indicator.dart';
import 'package:cvcar_mobile/app/global/custom_search_bar.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
  const ReservationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/categories/reservaspromociones.png",
                  width: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Label(label: "Mis reservas", sizeFont: 16.h),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 40.h,
              child: CustomSearchBar(
                hintText: "Buscar reserva, aliado, código...",
                suffixIcon: Icon(
                  Icons.search,
                  size: 25.w,
                  color: const Color(CVCarColors.greyLight),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ReservationCard()
          ],
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard({
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
              const CustomIndicator(
                isActive: true,
                status: "Vigente",
              )
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

class DataFormat extends StatelessWidget {
  const DataFormat({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        imagePath,
        width: 6.h,
        color: Colors.white,
      ),
      SizedBox(
        width: 8.w,
      ),
      Description(
        label: label,
        color: Colors.white,
        sizeFont: 11.sp,
      ),
    ]);
  }
}
