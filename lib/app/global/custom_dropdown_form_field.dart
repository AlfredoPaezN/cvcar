import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownFormField extends StatelessWidget {
  const CustomDropdownFormField({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.labelText,
    this.icon,
    this.enabled = true,
    this.enableBorder = true,
    this.validator,
    this.width,
    this.fillColor,
  }) : super(key: key);

  final List<DropdownMenuItem> items;
  final dynamic value;
  final void Function(dynamic) onChanged;
  final String? hint;
  final String? labelText;
  final Widget? icon;
  final bool enabled;
  final bool enableBorder;
  final String? Function(dynamic)? validator;
  final double? width;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPhoneMode = screenSize.width < 500;

    return Container(
      width: width ?? double.infinity,
      child: DropdownButtonFormField<dynamic>(
        value: value,
        alignment: Alignment.centerRight,
        items: items,
        onChanged: (e) {
          onChanged(e);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        selectedItemBuilder: enableBorder
            ? null
            : (BuildContext context) {
                return items.map<Widget>((DropdownMenuItem item) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.value.toString(),
                      style: TextStyle(
                        color: enabled ? Colors.white : Colors.grey.shade400,
                        fontSize: enableBorder ? 12.sp : 17.sp,
                      ),
                    ),
                  );
                }).toList();
              },
        decoration: InputDecoration(
          labelText: labelText,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: isPhoneMode ? 12.h : 8.h,
            horizontal: isPhoneMode ? 12.w : 8.w,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: const Color(CVCarColors.grey),
            fontSize: 14.sp,
            overflow: TextOverflow.ellipsis,
          ),
          errorStyle: TextStyle(
            color: Colors.transparent,
            fontSize: 0.sp,
            height: 1,
          ),
          prefixIcon: icon,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
            borderSide: BorderSide(
              width: 1,
              color: validator == null ? Colors.grey.shade300 : Colors.orange,
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
          focusedBorder: enableBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.r),
                  ),
                  borderSide: BorderSide(
                    width: 1.2,
                    color: enabled
                        ? Color(CVCarColors.secondaryColor)
                        : Colors.grey.shade300,
                  ),
                )
              : InputBorder.none,
          filled: true,
          fillColor: fillColor ?? Color(CVCarColors.primaryColor),
        ),
        style: TextStyle(
          color: enabled ? Colors.white : Colors.grey.shade400,
          fontSize: 12.sp,
        ),
        elevation: 4,
        dropdownColor: fillColor ?? Color(CVCarColors.backgroundColor),
        iconEnabledColor: Colors.white,
        validator: validator,
        isExpanded: true,
      ),
    );
  }
}
