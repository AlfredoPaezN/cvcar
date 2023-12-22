import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback action;
  final double? fontSize;
  final Widget? prefixWidget;
  final Widget? sufixWidget;
  final Color? textColor;
  final bool isLoading;
  const CustomButton(
      {required this.color,
      required this.label,
      required this.action,
      this.fontSize,
      Key? key,
      this.prefixWidget,
      this.isLoading = false,
      this.sufixWidget,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          // padding: const EdgeInsets.only(top: 14),
          height: 35.h,
          width: 300.w,
          child: Row(
            children: [
              Expanded(
                child: prefixWidget ?? Container(),
              ),
              Center(
                child: isLoading
                    ? LoadingAnimationWidget.prograssiveDots(
                        size: 40.sp,
                        color: Colors.white,
                      )
                    : Text(
                        label,
                        style: TextStyle(
                            fontSize: fontSize ?? 14.h,
                            color: textColor ?? Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
              ),
              Expanded(
                child: sufixWidget ?? Container(),
              ),
            ],
          )),
    );
  }
}
