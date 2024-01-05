import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:cvcar_mobile/app/modules/onboarding/views/onboarding_view.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class WelcomeView extends GetView<DashboardController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          physics: const BouncingScrollPhysics(),
          children: const [
            _View(
              image: LoadPngImage(path: 'assets/onboarding/bg.png'),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20.h),
          child: ListView(children: [
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
              height: 60.h,
            ),
            Label(
              label:
                  'Hola ${controller.authController.userData.value?.firstName}',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                  label: 'Bienvenido a',
                ),
                Label(
                  label: ' CV',
                  fontcolor: Color(CVCarColors.secondaryColor),
                ),
                Label(
                  label: 'CAR',
                ),
              ],
            ),

            SizedBox(
              height: 60.h,
            ),
            const Description(
              label:
                  'Nuestro Club de Amigos te ofrece un mundo de soluciones, con CVCAR viaja sin preocupaciones y convierte tu automóvil en tu compañero de vida.',
              // sizeFont: 16,
              textAlign: TextAlign.center,
              color: Colors.white,
            ),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0.w),
              child: CustomButton(
                  color: Color(CVCarColors.secondaryColor),
                  isLoading: false,
                  label: "Registrar mi  compañero",
                  action: () {
                    FocusScope.of(context).unfocus();
                    // controller.login();
                    Get.toNamed(Routes.REGISTER_VEHICLE);
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Description(
                  label: "Continuar sin mi compañero",
                  color: Color(CVCarColors.greyLight),
                  sizeFont: 11.h,
                ),
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}

class _View extends StatelessWidget {
  final Widget? image;

  const _View({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image ?? const SizedBox();
  }
}
