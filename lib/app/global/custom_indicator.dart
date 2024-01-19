import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
    required this.statusString,
    required this.status,
  }) : super(key: key);

  final colorStatus status;
  final String statusString;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 65.h,
        height: 15.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(CVCarColors.greyLight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 9.h,
              height: 9.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(4),
                color: setColor(status),
              ),
            ),
            Center(
              child: Label(
                  label: statusString, fontcolor: Colors.white, sizeFont: 8.sp),
            ),
          ],
        ),
      ),
    );
  }
}

Color setColor(status) {
  switch (status) {
    case colorStatus.active:
      return const Color(CVCarColors.active);

    case colorStatus.inactive:
      return const Color(CVCarColors.secondaryColor);

    case colorStatus.none:
      return const Color(CVCarColors.inactive);
    default:
      return const Color(CVCarColors.inactive);
  }
}

enum colorStatus { active, inactive, none }
