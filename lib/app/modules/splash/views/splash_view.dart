import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                height: 50.h,
                child:
                    Image(image: AssetImage('assets/logo/logo_completo.png'))),
            SizedBox(
              height: 20,
            ),
            controller.showQuote.value
                ? FadeIn(
                    child: SizedBox(
                      height: 45.h,
                      child: Column(
                        children: [
                          Description(
                            label: "Tu vehiculo, tu pasión",
                            color: Colors.white,
                            sizeFont: 20,
                          ),
                          Description(
                            label: "Tu mejor amigo",
                            color: Colors.white,
                            sizeFont: 20,
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: 45.h,
                  )
          ]),
        ),
      ),
    );
  }
}
