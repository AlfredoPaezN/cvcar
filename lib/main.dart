import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: const Color(CVCarColors.backgroundColor)),
        initialRoute: Routes.ONBOARDING,
        getPages: AppPages.routes,
      ),
    );
  }
}
