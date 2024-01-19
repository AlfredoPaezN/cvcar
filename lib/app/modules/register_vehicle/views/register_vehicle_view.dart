import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/global/custom_dropdown_form_field.dart';
import 'package:cvcar_mobile/app/global/custom_text_form_field.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/alerts.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Obx(
          () => Form(
            key: controller.formRegisterVehicle,
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
                Center(
                  child: Description(
                    label: '¡Es hora de brillar!',
                    color: Colors.white,
                    sizeFont: 10.h,
                  ),
                ),
                Center(
                  child: Description(
                    label: 'Registra tu vehículo y siente la diferencia.',
                    color: Colors.white,
                    sizeFont: 12.h,
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Description(
                      label: '¿El vehículo a registrar esta a su nombre?*',
                      color: Colors.white,
                      sizeFont: 9.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Description(
                      label: 'Si',
                      color: Colors.white,
                      sizeFont: 10.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                        height: 15.h,
                        width: 15.h,
                        child: Checkbox(
                            activeColor: Color(CVCarColors.primaryColor),
                            value: controller.isPropetary.value,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              controller.isPropetary.value =
                                  !controller.isPropetary.value;
                            })),
                    SizedBox(
                      width: 5.w,
                    ),
                    Description(
                      label: 'No',
                      color: Colors.white,
                      sizeFont: 10.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                        height: 15.h,
                        width: 15.h,
                        child: Checkbox(
                            activeColor: Color(CVCarColors.primaryColor),
                            value: !controller.isPropetary.value,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              controller.isPropetary.value =
                                  !controller.isPropetary.value;
                            })),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                CustomTextFormField(
                    // controller: controller.vehiclePlate.value,
                    hintText: 'Nombre del propietario*',
                    textInputType: TextInputType.emailAddress,
                    initialValue:
                        controller.authController.userData.value?.firstName,
                    readOnly: true,
                    enabled: false),

                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                    // controller: controller.vehiclePlate.value,
                    hintText: 'Apellido*',
                    textInputType: TextInputType.emailAddress,
                    initialValue:
                        controller.authController.userData.value?.lastName,
                    readOnly: true,
                    enabled: true),

                SizedBox(
                  height: 10.h,
                ),
                CustomDropdownFormField(
                  items: controller.documenTypeItemList,
                  hint: 'Tipo de documento*',
                  enabled: true,
                  onChanged: (value) {
                    print("value $value");
                    controller.documenType.value.text = value.toString();
                  },
                  value: controller.documenType.value.text.isNotEmpty
                      ? controller.documenType.value.text
                      : controller.documenTypeItemList.first.value,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                    controller: controller.documenNumber.value,
                    hintText: 'Numero de documento*',
                    textInputType: TextInputType.number,
                    enabled: true),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                    controller: controller.vehiclePlate.value,
                    hintText: 'Placa del vehículo*',
                    textInputType: TextInputType.emailAddress,
                    enabled: true),

                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: Checkbox(
                            activeColor: Color(CVCarColors.primaryColor),
                            value: controller.termsAndConditions.value,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              controller.termsAndConditions.value = value!;
                            })),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      children: [
                        Description(
                          label: "Acepto ",
                          sizeFont: 11.h,
                          color: Color(CVCarColors.greyLight),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Description(
                            label: "Términos y condiciones",
                            sizeFont: 11.h,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: Checkbox(
                            activeColor: Color(CVCarColors.primaryColor),
                            value: controller.personalData.value,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              controller.personalData.value = value!;
                            })),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      children: [
                        Description(
                          label: "Acepto el tratamiento de ",
                          sizeFont: 11.h,
                          color: Color(CVCarColors.greyLight),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Description(
                            label: "Datos Personales",
                            sizeFont: 11.h,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                    color: Color(CVCarColors.secondaryColor),
                    label: "Registrar vehículo",
                    isLoading: controller.isLoading.value,
                    action: () {
                      if (!controller.personalData.value) {
                        informationAlert(
                          context: context,
                          infoMessage:
                              "Debes aceptar el tratamiento de datos personales",
                          title: "Eliminar cuenta",
                        ).show();
                      } else if (!controller.termsAndConditions.value) {
                        informationAlert(
                          context: context,
                          infoMessage:
                              "Debes aceptar los términos y condiciones",
                          title: "Eliminar cuenta",
                        ).show();
                      } else {
                        controller.createVehicle(context);
                      }
                    }),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(Routes.APP_NAVIGATION);
                      },
                      child: Description(
                        label: "Omitir registro  |  ->",
                        sizeFont: 11.h,
                        color: Color(CVCarColors.greyLight),
                      ),
                    ),
                  ],
                )
                // const IndicatorDivisor(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
