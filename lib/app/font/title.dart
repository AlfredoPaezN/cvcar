import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Label extends StatelessWidget {
  const Label(
      {required this.label,
      this.sizeFont,
      Key? key,
      this.fontcolor,
      this.textAlign = TextAlign.center})
      : super(key: key);
  final String label;
  final double? sizeFont;
  final Color? fontcolor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: sizeFont ?? 18.h,
          color: fontcolor ?? Colors.white,
          fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}
