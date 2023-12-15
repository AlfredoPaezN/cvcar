import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/global/custom_divider.dart';
import 'package:cvcar_mobile/app/global/custom_dropdown_form_field.dart';
import 'package:cvcar_mobile/app/global/custom_text_form_field.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Description(
                label: '¿Ya tienes una cuenta?',
                sizeFont: 12.h,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Label(
                  label: 'Inicia sesión',
                  sizeFont: 12.h,
                  fontcolor: Color(CVCarColors.secondaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Obx(
          () => ListView(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                'assets/logo/isotipo_color.png',
                height: 30.h,
                width: 50.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              const Label(
                label: 'Hola',
              ),

              const SizedBox(
                height: 6,
              ),
              const Description(
                label: 'Para continuar crea una cuenta',
                // sizeFont: 16,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
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
                  // obscureText: controller.isPasswordVisible.value,
                  // suffixIcon: controller.seePassword(),
                  enabled: true),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                  controller: controller.emailController.value,
                  hintText: 'Correo electrónico',
                  textInputType: TextInputType.emailAddress,
                  enabled: true),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                  controller: controller.passController.value,
                  hintText: 'Contraseña',
                  textInputType: TextInputType.emailAddress,
                  obscureText: controller.isPasswordVisible.value,
                  suffixIcon: controller.seePassword(),
                  enabled: true),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                  controller: controller.confirmPassController.value,
                  hintText: 'Confirmar contraseña',
                  textInputType: TextInputType.emailAddress,
                  obscureText: controller.isConfirmPasswordVisible.value,
                  suffixIcon: controller.seeConfirmPassword(),
                  enabled: true),

              const SizedBox(
                height: 14,
              ),

              const SizedBox(
                height: 43,
              ),
              CustomButton(
                  color: Color(CVCarColors.secondaryColor),
                  label: "Registrarme",
                  action: () {
                    Get.offAndToNamed(Routes.REGISTER_VEHICLE);
                  }),
              // const IndicatorDivisor(),
              SizedBox(
                height: 43,
              ),
              const CustomDivider(),
              const SizedBox(
                height: 30,
              ),
              // CustomButton(
              //     color: Color(CVCarColors.primaryColor),
              //     label: "Continuar con Google",
              //     fontSize: 11.h,
              //     prefixWidget: Image.asset(
              //       'assets/logo/google.png',
              //       height: 15.h,
              //       width: 15.w,
              //     ),
              //     action: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
