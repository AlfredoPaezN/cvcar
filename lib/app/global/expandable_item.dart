import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ExpandableItem extends StatelessWidget {
  const ExpandableItem({
    Key? key,
    this.title,
    this.isExpanded = false,
    this.expandedContent,
    this.indicator,
    this.onTap,
    this.edit = false,
  }) : super(key: key);

  final String? title;
  final bool isExpanded;
  final Widget? expandedContent;
  final Callback? onTap;
  final Widget? indicator;
  final bool edit;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: onTap,
        // enableFeedback: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(CVCarColors.primaryColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(14),
                height: 40.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Label(
                            label: title ?? "",
                            fontcolor: Colors.white,
                            sizeFont: 15.sp,
                          ),
                          Expanded(child: SizedBox()),
                          indicator ??
                              Container(
                                width: 20.h,
                                height: 20.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(4),
                                  color: Color(CVCarColors.greyLight),
                                ),
                                child: Center(
                                  child: edit
                                      ? const Icon(
                                          Icons.edit,
                                          size: 15,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 150),
                reverseDuration: const Duration(milliseconds: 1500),
                firstCurve: Curves.bounceIn,
                secondCurve: Curves.bounceIn,
                firstChild: const SizedBox(),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                secondChild: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 14.0, bottom: 7.0),
                    child: expandedContent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
