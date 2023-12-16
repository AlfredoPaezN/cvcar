import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.textInputType,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.validator,
    this.inputFormatters,
    this.autofocus,
    this.readOnly = false,
    this.showCursor = true,
    this.obscureText = false,
    this.leftPadding,
    this.topPadding,
    this.rightPadding,
    this.bottomPadding,
    this.autovalidateMode,
    this.fillColor,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? initialValue;
  final void Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? textInputType;
  // final String? labelText;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final bool readOnly;
  final bool showCursor;
  final bool obscureText;
  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final AutovalidateMode? autovalidateMode;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPhoneMode = screenSize.width < 500;
    return Container(
      padding: EdgeInsets.fromLTRB(
        leftPadding ?? 0,
        topPadding ?? 0,
        rightPadding ?? 0,
        bottomPadding ?? 0,
      ),
      width: double.infinity,
      child: SizedBox(
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: textInputType,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          onTap: onTap,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          autofocus: autofocus ?? false,
          cursorColor: const Color(CVCarColors.primaryColor),
          readOnly: readOnly,
          showCursor: showCursor,
          obscureText: obscureText,
          autovalidateMode: autovalidateMode,
          style: TextStyle(
              color: readOnly ? Colors.grey.shade400 : Colors.white,
              fontSize: 12.sp),
          decoration: InputDecoration(
            errorStyle: TextStyle(
              color: Colors.transparent,
              fontSize: 0.sp,
              height: 1,
            ),

            labelText: labelText,
            filled: true,
            fillColor: Color(CVCarColors.primaryColor),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: isPhoneMode ? 12.h : 8.h,
                horizontal: isPhoneMode ? 12.w : 8.w),
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(CVCarColors.grey),
              fontSize: 14.sp,
              overflow: TextOverflow.ellipsis,
            ),
            prefixIcon: prefixIcon, // myIcon is a 48px-wide widget.
            suffixIcon: suffixIcon, // myIcon is a 48px-wide widget.

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              borderSide: BorderSide(
                width: 1,
                color: readOnly && validator == null
                    ? Colors.grey.shade300
                    : Colors.orange,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              borderSide: BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              borderSide: BorderSide(
                width: 1.2,
                color: readOnly
                    ? Colors.grey.shade300
                    : Color(CVCarColors.secondaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
