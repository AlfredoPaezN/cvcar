import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTileField extends StatelessWidget {
  CustomTileField({
    Key? key,
    required this.trainingIcon,
    required this.trailiingIcon,
    required this.label,
    this.justTopRounded = borderRadius.all,
  }) : super(key: key);

  Widget trainingIcon;
  Widget trailiingIcon;
  String label;
  Enum justTopRounded;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry? setBorder() {
      switch (justTopRounded) {
        case borderRadius.all:
          return BorderRadius.circular(5);

        case borderRadius.top:
          return BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          );

        case borderRadius.none:
          return null;
        case borderRadius.bottom:
          return BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          );
      }
    }

    return Container(
      height: 36.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(CVCarColors.primaryColor),
        borderRadius: setBorder(),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          children: [
            // Image.asset("assets/informative/usuario.png", width: 10.h),
            trainingIcon,
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Description(
                label: label,
                sizeFont: 12.h,
                color: Colors.white,
              ),
            ),
            trailiingIcon,
            // Image.asset("assets/informative/editar.png", width: 25.h),
          ],
        ),
      ),
    );
  }
}

enum borderRadius { all, top, none, bottom }
