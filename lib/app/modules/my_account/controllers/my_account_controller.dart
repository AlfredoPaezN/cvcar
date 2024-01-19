import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAccountController extends GetxController {
  AuthController authController;
  MyAccountController({required this.authController});

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

  Future<void> lauchLink(String url) async {
    final Uri urlParsed = Uri.parse(url);
    if (!await launchUrl(urlParsed)) {
      throw "No se pudo ingresar al sitio web $url";
    }
  }
}
