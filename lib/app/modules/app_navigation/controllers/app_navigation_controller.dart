import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppNavigationController extends GetxController {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  RxInt pageIndexSelected = 0.obs;
  RxString currentPageName = ''.obs;

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
}
