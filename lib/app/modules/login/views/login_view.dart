import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/global/custom_text_form_field.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:cvcar_mobile/app/utils/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              label: 'Hola',
            ),

            const SizedBox(
              height: 6,
            ),
            const Description(
              label: 'Para continuar inicia sesión',
              // sizeFont: 16,
              textAlign: TextAlign.center,
              color: Colors.white,
            ),
            SizedBox(
              height: 18.h,
            ),
            Obx(
              () => Form(
                  key: controller.formLogin,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          CustomTextFormField(
                              validator: validateEmail,
                              controller: controller.emailController.value,
                              hintText: 'Correo electrónico',
                              textInputType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              enabled: true),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => CustomTextFormField(
                            validator: validatePassword,
                            controller: controller.passController.value,
                            hintText: 'Contraseña',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputType: TextInputType.emailAddress,
                            obscureText: controller.isPasswordObscured.value,
                            suffixIcon: controller.seePassword(),
                            enabled: true),
                      ),
                    ],
                  )),
            ),

            const SizedBox(
              height: 14,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Description(
                  label: 'Olvidé mi contraseña',
                  sizeFont: 10.h,
                  textAlign: TextAlign.center,
                  color: Colors.white,
                ),
              ],
            ),

            const SizedBox(
              height: 43,
            ),
            Obx(
              () => CustomButton(
                  color: Color(CVCarColors.secondaryColor),
                  isLoading: controller.isLoading.value,
                  label: "Iniciar sesión",
                  action: controller.isLoading.value
                      ? () {}
                      : () {
                          FocusScope.of(context).unfocus();
                          controller.login();
                          // Get.toNamed(Routes.WELCOME);
                        }),
            ),
            // const IndicatorDivisor(),
            // SizedBox(
            //   height: 43,
            // ),
            // const CustomDivider(),
            // const SizedBox(
            //   height: 30,
            // ),
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
            SizedBox(
              height: 60.h,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Label(
                    label: 'Crea una cuenta CVCAR',
                    sizeFont: 12.h,
                    fontcolor: Color(CVCarColors.secondaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
