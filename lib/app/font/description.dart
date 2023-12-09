import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Description extends StatelessWidget {
  const Description(
      {required this.label,
      this.color,
      this.sizeFont,
      this.textAlign,
      Key? key})
      : super(key: key);
  final String label;
  final double? sizeFont;
  final TextAlign? textAlign;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: sizeFont ?? 14.h,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
