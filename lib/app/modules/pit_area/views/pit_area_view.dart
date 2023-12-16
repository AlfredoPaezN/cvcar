import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_dropdown_form_field.dart';
import 'package:cvcar_mobile/app/global/custom_search_bar.dart';
import 'package:cvcar_mobile/app/modules/reservations/views/reservations_view.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/pit_area_controller.dart';

class PitAreaView extends GetView<PitAreaController> {
  const PitAreaView({Key? key}) : super(key: key);
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
                  "assets/categories/zonadepits.png",
                  width: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Label(label: "Zona de PITS", sizeFont: 16.h),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 40.h,
              child: CustomSearchBar(
                hintText: "¿Qué estás buscando?",
                suffixIcon: Icon(
                  Icons.search,
                  size: 25.w,
                  color: const Color(CVCarColors.greyLight),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomDropdownFormField(
                      fillColor: Color(CVCarColors.primaryColor),
                      items: [
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.white,
                                size: 15.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text('Barranquilla'),
                            ],
                          ),
                          value: "Barranquilla",
                        )
                      ],
                      value: "Barranquilla",
                      onChanged: (v) {}),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: CustomDropdownFormField(
                      fillColor: Color(CVCarColors.primaryColor),
                      items: [
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Icon(
                                Icons.tune,
                                color: Colors.white,
                                size: 15.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text('Automoviles'),
                            ],
                          ),
                          value: "Automoviles",
                        )
                      ],
                      value: "Automoviles",
                      onChanged: (v) {}),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            FadeInRight(
              child: SizedBox(
                height: 110.h,
                child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
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
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
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
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
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
                    ]),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 60.h,
              width: double.infinity,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes.VEHICLE_DETAIL);
                        },
                        child: GestureDetector(
                          onTap: () {
                            controller.categorieSelected.value = index;
                          },
                          child: Obx(
                            () => Categorie(
                              selected:
                                  controller.categorieSelected.value == index,
                              label: controller.categories.values
                                  .elementAt(index)
                                  .label,
                              imagePath: controller.categories.values
                                  .elementAt(index)
                                  .imagePath,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            PitCard(),
            SizedBox(
              height: 20.h,
            ),
            PitCard()
          ],
        ),
      ),
    );
  }
}

class Categorie extends StatelessWidget {
  const Categorie({
    Key? key,
    required this.label,
    required this.imagePath,
    this.selected = false,
  }) : super(key: key);

  final String label;
  final String imagePath;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: selected
                ? Border.all(color: Color(CVCarColors.secondaryColor), width: 2)
                : null,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: 40.h,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Label(label: label, sizeFont: 8.h),
      ],
    );
  }
}

class PitCard extends StatelessWidget {
  const PitCard({
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
              Image.asset('assets/categories/brand.png'),
              SizedBox(
                width: 10.w,
              ),
              Label(
                label: "Auto spa detailing",
                fontcolor: Colors.white,
                sizeFont: 12.sp,
              ),
            ],
          ),
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Description(
                label:
                    "Limpiamos, rejuvenecemos las distintas superficies de tu vehículo, utilizando productos de alta calidad y tecnología de punta.",
                sizeFont: 10.sp,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              DataFormat(
                  imagePath: "assets/informative/location-sharp.png",
                  label: "Cra 56 # 47 29, barrio Tabor"),
              SizedBox(
                height: 3.h,
              ),
              DataFormat(
                  imagePath: "assets/informative/phone.png",
                  label: "301 4267 324"),
              SizedBox(
                height: 3.h,
              ),
              DataFormat(
                  imagePath: "assets/informative/clock-fill.png",
                  label: "L a V de 8am a 6pm, S de 10am a 1pm"),
            ],
          ),
        ),
        Container(
            height: 25.h,
            width: double.infinity,
            color: Color(CVCarColors.grey).withOpacity(0.3),
            child: Center(
              child: Description(
                label: "Conocer aliado",
                color: Colors.white,
                sizeFont: 9.sp,
              ),
            ))
      ]),
    );
  }
}
