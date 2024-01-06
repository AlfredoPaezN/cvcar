import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_tile.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/alerts.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(25.0),
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/categories/micuenta.png",
                      width: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Label(label: "Mi cuenta", sizeFont: 16.h),
                  ],
                ),
              ),
              Container(
                height: 25.h,
                width: 80.w,
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                  color: Color(CVCarColors.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/informative/coins.png",
                      width: 15.h,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Label(
                      label: "100",
                      sizeFont: 12.h,
                      fontcolor: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTileField(
            trainingIcon: Image.asset(
              "assets/informative/usuario.png",
              width: 10.h,
            ),
            trailiingIcon: Image.asset(
              "assets/informative/editar.png",
              width: 25.h,
            ),
            label:
                "${controller.authController.userData.value?.firstName ?? ""} ${controller.authController.userData.value?.lastName ?? ""}",
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTileField(
            trainingIcon: Image.asset(
              "assets/informative/mail.png",
              width: 10.h,
            ),
            trailiingIcon: Image.asset(
              "assets/informative/editar.png",
              width: 25.h,
            ),
            label: controller.authController.userData.value?.email ?? "",
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTileField(
            trainingIcon: Image.asset(
              "assets/informative/phone.png",
              width: 10.h,
            ),
            trailiingIcon: Image.asset(
              "assets/informative/editar.png",
              width: 25.h,
            ),
            label: controller.authController.userData.value?.phone ??
                "No registra",
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.LICENSE_DETAIL);
            },
            child: CustomTileField(
              trainingIcon: Icon(
                Icons.medical_information_outlined,
                size: 13.h,
                color: Color(CVCarColors.grey),
              ),
              trailiingIcon: SizedBox(),
              label: "Licencia de conducción",
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SettingsSection(
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MyAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(label: "Ajustes", sizeFont: 12.h),
        SizedBox(
          height: 15.h,
        ),
        CustomTileField(
          justTopRounded: BorderRadiusEnum.top,
          trainingIcon: Image.asset(
            "assets/informative/notificaciones.png",
            width: 10.h,
          ),
          trailiingIcon: const SizedBox(),
          label: "Notificaciones",
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        CustomTileField(
          justTopRounded: BorderRadiusEnum.none,
          trainingIcon: Image.asset(
            "assets/informative/preguntas-frecuentes.png",
            width: 10.h,
          ),
          trailiingIcon: const SizedBox(),
          label: "Preguntas frecuentes",
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        CustomTileField(
          justTopRounded: BorderRadiusEnum.none,
          trainingIcon: Image.asset(
            "assets/informative/politicas-de-privacidad.png",
            width: 10.h,
          ),
          trailiingIcon: const SizedBox(),
          label: "Politicas de privacidad",
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        CustomTileField(
          justTopRounded: BorderRadiusEnum.bottom,
          trainingIcon: Image.asset(
            "assets/informative/cvcar-isotipo-gris.png",
            width: 12.h,
          ),
          trailiingIcon: const SizedBox(),
          label: "Sobre CVCAR",
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        GestureDetector(
          onTap: () {
            informationAlert(
              context: context,
              infoMessage: "¿Estas seguro que quieres eliminar la cuenta?",
              callback: () {
                controller.authController.deleteAccount(context);
              },
              title: "Cerrar sesión",
            ).show();
          },
          child: CustomTileField(
            justTopRounded: BorderRadiusEnum.none,
            trainingIcon: Icon(Icons.delete_outline_outlined,
                size: 13.h, color: Color(CVCarColors.grey)),
            trailiingIcon: const SizedBox(),
            label: "Eliminar cuenta",
          ),
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        GestureDetector(
          onTap: () {
            informationAlert(
              context: context,
              infoMessage: "¿Estas seguro que quieres cerrar sesión?",
              callback: () {
                controller.authController.logout();
              },
              title: "Cerrar sesión",
            ).show();
          },
          child: CustomTileField(
            justTopRounded: BorderRadiusEnum.bottom,
            trainingIcon: Image.asset(
              "assets/informative/cerrar-sesion.png",
              width: 9.h,
            ),
            trailiingIcon: const SizedBox(),
            label: "Cerrar sesión",
          ),
        ),
      ],
    ));
  }
}
