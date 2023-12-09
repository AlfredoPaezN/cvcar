import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Label extends StatelessWidget {
  const Label({required this.label, this.sizeFont, Key? key}) : super(key: key);
  final String label;
  final double? sizeFont;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: sizeFont ?? 18.h,
          color: Colors.white,
          fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}
