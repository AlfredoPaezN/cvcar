import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/global/custom_dropdown_form_field.dart';
import 'package:cvcar_mobile/app/global/custom_text_form_field.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/register_vehicle_controller.dart';

class RegisterVehicleView extends GetView<RegisterVehicleController> {
  const RegisterVehicleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60.h,
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.offAndToNamed(Routes.APP_NAVIGATION);
            },
            child: Label(
              label: 'Registrar después',
              sizeFont: 12.h,
              fontcolor: Color(CVCarColors.secondaryColor),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              'assets/logo/isotipo_color.png',
              height: 30.h,
              width: 50.w,
            ),
            //ImageAtom(path: 'assets/logo/isotipo_color.png',altura: 26, ancho: 44,),
            SizedBox(
              height: 20.h,
            ),
            const Label(
              label: 'Gana 4 monedas por registrar tu primer vehículo',
            ),

            SizedBox(
              height: 18.h,
            ),
            CustomTextFormField(
                controller: controller.vehiclePlate.value,
                hintText: 'Placa del vehículo',
                textInputType: TextInputType.emailAddress,
                enabled: true),
            SizedBox(
              height: 10.h,
            ),
            CustomDropdownFormField(
              items: controller.documenTypeItemList,
              hint: 'Tipo de documento',
              enabled: true,
              onChanged: (value) {
                print("value $value");
                controller.documenType.value.text = value.toString();
              },
              value: controller.documenType.value.text.isNotEmpty
                  ? controller.documenType.value.text
                  : null,
            ),

            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
                controller: controller.documenNumber.value,
                hintText: 'Numero de documento',
                textInputType: TextInputType.number,
                enabled: true),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/informative/info.png',
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text:
                          'El número de documento debe corresponder al registrado en la tarjeta de propiedad.',
                      style: TextStyle(
                        color: Color(CVCarColors.greyLight),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
                color: Color(CVCarColors.secondaryColor),
                label: "Registrar vehículo",
                action: () {
                  Get.offAndToNamed(Routes.APP_NAVIGATION);
                }),
            // const IndicatorDivisor(),
          ],
        ),
      ),
    );
  }
}
