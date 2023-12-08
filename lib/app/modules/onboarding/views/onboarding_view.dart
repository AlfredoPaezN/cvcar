import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  final PageController _pageController = PageController();

  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (page) {
                controller.currentPage.value = page;
              },
              physics: const BouncingScrollPhysics(),
              children: const [
                _View(
                  image: _LoadPngImage(
                      path: 'assets/images/tracking-realtime.png'),
                  title: 'Tracking Realtime',
                  description:
                      'The easiest way to track your fleet in realtime!',
                ),
                _View(
                  image:
                      _LoadPngImage(path: 'assets/images/fleet-management.png'),
                  title: 'Manage a Fleet',
                  description: 'Add and manage all your fleet',
                ),
                _View(
                  image: _LoadPngImage(path: 'assets/images/is-free.png'),
                  title: 'IS FREE!!',
                  description: 'Your account is Freemium',
                ),
              ],
            ),
            Obx(
              () => _BottomSection(
                currentPage: controller.currentPage.value,
                pageController: _pageController,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LoadPngImage extends StatelessWidget {
  const _LoadPngImage({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.55.sw,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Image.asset(path),
    );
  }
}

class _BottomSection extends StatelessWidget {
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
    OnboardingController controller = OnboardingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: currentPage <= 1
                  ? TextButton(
                      onPressed: () => controller.navigationRoutes(),
                      child: Text(
                        'Skip',
                      ),
                    )
                  : Container(),
            ),
            Expanded(
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                      dotColor: Colors.yellow,
                      activeDotColor: Colors.red,
                      dotWidth: 14.w,
                      dotHeight: 14.h),
                  onDotClicked: (index) => _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInBack),
                ),
              ),
            ),
            Expanded(
              child: currentPage <= 1
                  ? TextButton(
                      onPressed: () {
                        _pageController.animateToPage(currentPage + 1,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      },
                      child: Text('Next'),
                    )
                  : TextButton(
                      onPressed: () => controller.navigationRoutes(),
                      child: Text(
                        'Done',
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

class _View extends StatelessWidget {
  final String title;
  final String description;
  final Widget? image;

  const _View({
    Key? key,
    required this.title,
    required this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image ?? const SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              title,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              description,
            ),
          ),
        ],
      ),
    );
  }
}
