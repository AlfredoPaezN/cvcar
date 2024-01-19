import 'package:cvcar_mobile/app/global/custom_indicator.dart';
import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:cvcar_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VehicleCvController extends GetxController {
  AuthController authController;
  DashboardController dashboardController;
  VehicleCvController(
      {required this.authController, required this.dashboardController});
  RxBool isExpanded = false.obs;
  RxList<int> cardIndexOpennedList = <int>[].obs;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int calculateMonthsDifference(DateTime startDate, DateTime endDate) {
    int startMonths = startDate.year * 12 + startDate.month;
    int endMonths = endDate.year * 12 + endDate.month;
    return endMonths - startMonths;
  }

  handleExpand(int index) {
    if (cardIndexOpennedList.contains(index)) {
      cardIndexOpennedList.remove(index);
    } else {
      cardIndexOpennedList.add(index);
    }
  }

  String setStringStatus(status) {
    switch (status) {
      case colorStatus.active:
        return "Vigente";

      case colorStatus.inactive:
        return "Vencido";

      default:
        return "Configurar";
    }
  }
}
