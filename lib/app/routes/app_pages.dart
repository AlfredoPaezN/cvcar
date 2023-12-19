import 'package:get/get.dart';

import '../modules/app_navigation/bindings/app_navigation_binding.dart';
import '../modules/app_navigation/views/app_navigation_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_account/bindings/my_account_binding.dart';
import '../modules/my_account/views/my_account_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/pit_area/bindings/pit_area_binding.dart';
import '../modules/pit_area/views/pit_area_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_vehicle/bindings/register_vehicle_binding.dart';
import '../modules/register_vehicle/views/register_vehicle_view.dart';
import '../modules/reservations/bindings/reservations_binding.dart';
import '../modules/reservations/views/reservations_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/vehicle_cv/bindings/vehicle_cv_binding.dart';
import '../modules/vehicle_cv/views/vehicle_cv_view.dart';
import '../modules/vehicle_detail/bindings/vehicle_detail_binding.dart';
import '../modules/vehicle_detail/views/vehicle_detail_view.dart';

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
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.PIT_AREA,
      page: () => const PitAreaView(),
      binding: PitAreaBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATIONS,
      page: () => const ReservationsView(),
      binding: ReservationsBinding(),
    ),
    GetPage(
      name: _Paths.MY_ACCOUNT,
      page: () => const MyAccountView(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: _Paths.VEHICLE_DETAIL,
      page: () => const VehicleDetailView(),
      binding: VehicleDetailBinding(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.VEHICLE_CV,
      page: () => const VehicleCvView(),
      binding: VehicleCvBinding(),
    ),
  ];
}
