import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert informationAlert({
  context,
  infoMessage,
  callback,
  String? paragraph,
  String? title,
}) {
  return Alert(
    context: context,
    // type: AlertType,
    // title: title,

    style: const AlertStyle(
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      backgroundColor: Color(CVCarColors.primaryColor),
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    // desc: infoMessage,
    content: Column(
      children: [
        title != null
            ? Column(
                children: [
                  Label(
                    label: title,
                    fontcolor: Colors.white,
                    sizeFont: 16.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )
            : SizedBox(),
        infoMessage != null
            ? Column(
                children: [
                  Label(
                    label: infoMessage,
                    fontcolor: Colors.white,
                    sizeFont: 14.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )
            : SizedBox(),
        paragraph != null
            ? Label(
                label: paragraph,
                fontcolor: Colors.white,
                sizeFont: 14.h,
              )
            : SizedBox()
      ],
    ),
    buttons: [
      DialogButton(
        color: const Color(CVCarColors.secondaryColor),
        onPressed: callback ?? () => Get.back(),
        width: 200.w,
        child: Label(
          label: "Confirm",
          fontcolor: Colors.white,
          sizeFont: 14.h,
        ),
      )
    ],
  );
}
