import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/global/frosted_glass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/onboarding_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            PageView(
              controller: controller.pageController.value,
              onPageChanged: (page) {
                controller.currentPage.value = page;
                controller.getTitle(page);
                controller.getSubtitle(page);
              },
              physics: const BouncingScrollPhysics(),
              children: const [
                _View(
                  image: LoadPngImage(path: 'assets/onboarding/ob1.png'),
                ),
                _View(
                  image: LoadPngImage(path: 'assets/onboarding/ob2.png'),
                ),
                _View(
                  image: LoadPngImage(path: 'assets/onboarding/ob3.png'),
                ),
              ],
            ),
            Positioned(
                top: 35.h,
                left: 40.w,
                child: Image.asset(
                  "assets/logo/isotipo_blanco.png",
                  scale: 9.0,
                )),
            _BottomSection(
              currentPage: controller.currentPage.value,
              pageController: controller.pageController.value,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadPngImage extends StatelessWidget {
  const LoadPngImage({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.fitHeight,
    );
  }
}

class _BottomSection extends GetView<OnboardingController> {
  const _BottomSection({
    Key? key,
    required this.currentPage,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final int currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white,
                    dotWidth: 8.w,
                    dotHeight: 8.h),
                onDotClicked: (index) => _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInBack),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => FrostedGlassBox(
                theWidth: double.infinity,
                theHeight: 250.0.h,
                theChild: BottomContainer(
                  title: controller.title.value,
                  detail: controller.subtitle.value,
                  isLastPage: currentPage == 2,
                  firtButton: currentPage <= 1
                      ? () {
                          _pageController.animateToPage(currentPage + 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        }
                      : () => controller.navigationRoutes(),
                  secondButton: currentPage <= 1
                      ? () => controller.navigationRoutes()
                      : () {},
                ),
              ),
            ),
          ],
        ));
  }
}

class _View extends StatelessWidget {
  final Widget? image;

  const _View({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image ?? const SizedBox();
  }
}

class BottomContainer extends StatelessWidget {
  final String title;
  final String detail;
  final Function() firtButton;
  final Function() secondButton;
  final bool isLastPage;
  const BottomContainer({
    Key? key,
    required this.title,
    required this.detail,
    required this.firtButton,
    required this.secondButton,
    required this.isLastPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 41, left: 37, right: 37),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100.h,
              child: Column(children: [
                Text(title,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 17,
                ),
                Text(detail,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center),
              ]),
            ),
            const SizedBox(height: 23.5),
            CustomButton(
              color: Colors.red,
              label: isLastPage ? "Comenzar" : "Siguiente",
              action: firtButton,
              fontSize: 16,
            ),
            CustomButton(
              color: Colors.transparent,
              label: "Omitir",
              action: secondButton,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
