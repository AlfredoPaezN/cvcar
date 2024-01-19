import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/global/custom_text_form_field.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:cvcar_mobile/app/utils/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 10.h,
            ),
            const Label(
              label: 'Recuperar contraseña',
            ),
            SizedBox(
              height: 18.h,
            ),
            Obx(
              () => Form(
                  key: controller.formForgotPass,
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
                          SizedBox(
                            height: 10.h,
                          ),
                          Description(
                            label:
                                'Ingresa tu correo electrónico y te enviaremos un enlace para que puedas recuperar tu contraseña',
                            sizeFont: 12,
                            textAlign: TextAlign.center,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 43,
            ),
            Obx(
              () => CustomButton(
                  color: Color(CVCarColors.secondaryColor),
                  isLoading: controller.isLoading.value,
                  label: "Recuperar contraseña",
                  action: () {
                    controller.forgotPassword();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
