import 'package:cvcar_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:cvcar_mobile/app/modules/my_account/views/my_account_view.dart';
import 'package:cvcar_mobile/app/modules/pit_area/views/pit_area_view.dart';
import 'package:cvcar_mobile/app/modules/reservations/views/reservations_view.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/menu_icons/vehiculo1.png",
        width: 25,
      ),
      inactiveIcon: Image.asset(
        "assets/menu_icons/vehiculo0.png",
        width: 20,
      ),
      title: ("Mis vehiculos"),
      activeColorPrimary: const Color(CVCarColors.secondaryColor),
      inactiveColorPrimary: const Color(CVCarColors.greyLight),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/menu_icons/pits1.png",
        width: 25,
      ),
      inactiveIcon: Image.asset(
        "assets/menu_icons/pits0.png",
        width: 16,
      ),
      title: ("Zona de Pits"),
      activeColorPrimary: const Color(CVCarColors.secondaryColor),
      inactiveColorPrimary: const Color(CVCarColors.greyLight),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/menu_icons/reserva1.png",
        width: 25,
      ),
      inactiveIcon: Image.asset(
        "assets/menu_icons/reserva0.png",
        width: 20,
      ),
      title: ("Mis reservas"),
      activeColorPrimary: const Color(CVCarColors.secondaryColor),
      inactiveColorPrimary: const Color(CVCarColors.greyLight),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/menu_icons/cuenta1.png",
        width: 25,
      ),
      inactiveIcon: Image.asset(
        "assets/menu_icons/cuenta0.png",
        width: 20,
      ),
      title: ("Mi cuenta"),
      activeColorPrimary: const Color(CVCarColors.secondaryColor),
      inactiveColorPrimary: const Color(CVCarColors.greyLight),
    ),
  ];
}

List<Widget> menuBuildScreens() {
  return [
    const DashboardView(),
    const PitAreaView(),
    const ReservationsView(),
    const MyAccountView()
  ];
}
