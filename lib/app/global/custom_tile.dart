import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTileField extends StatelessWidget {
  const CustomTileField({
    Key? key,
    required this.trainingIcon,
    required this.trailiingIcon,
    required this.label,
    this.justTopRounded = BorderRadiusEnum.all,
  }) : super(key: key);

  final Widget trainingIcon;
  final Widget trailiingIcon;
  final String label;
  final Enum justTopRounded;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry? setBorder() {
      switch (justTopRounded) {
        case BorderRadiusEnum.all:
          return BorderRadius.circular(5);

        case BorderRadiusEnum.top:
          return const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          );

        case BorderRadiusEnum.none:
          return null;
        case BorderRadiusEnum.bottom:
          return const BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          );
      }
      return null;
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

enum BorderRadiusEnum { all, top, none, bottom }
