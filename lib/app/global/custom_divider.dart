import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
              color: Color(CVCarColors.grey),
              height: 30,
              // indent: 36,
              endIndent: 0),
        ),
        SizedBox(
          width: 10.w,
        ),
        Icon(
          Icons.circle_outlined,
          color: Color(CVCarColors.grey),
          size: 11,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Divider(
              color: Color(CVCarColors.grey),
              height: 30,
              // indent: 36,
              endIndent: 0),
        ),
      ],
    );
  }
}
