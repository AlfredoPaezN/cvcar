import 'package:get/get.dart';

import '../modules/app_navigation/bindings/app_navigation_binding.dart';
import '../modules/app_navigation/views/app_navigation_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_vehicle/bindings/register_vehicle_binding.dart';
import '../modules/register_vehicle/views/register_vehicle_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => OnboardingView(),
        binding: OnboardingBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeftWithFade),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_VEHICLE,
      page: () => const RegisterVehicleView(),
      binding: RegisterVehicleBinding(),
    ),
    GetPage(
      name: _Paths.APP_NAVIGATION,
      page: () => const AppNavigationView(),
      binding: AppNavigationBinding(),
    ),
  ];
}
