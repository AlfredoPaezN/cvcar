import 'package:cvcar_mobile/app/global/flip_widget.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: const Color(CVCarColors.backgroundColor),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FlipView(
              front: SizedBox(
                width: screenSize.width > 500 ? 0.2.sw : 0.4.sw,
                child: const Image(
                    image: AssetImage('assets/logo/logo_completo.png')),
              ),
              back: SizedBox(
                width: screenSize.width > 500 ? 0.2.sw : 0.4.sw,
                child: const Image(
                    image: AssetImage('assets/logo/logo_completo.png')),
              )),
        ]),
      ),
    );
  }
}
