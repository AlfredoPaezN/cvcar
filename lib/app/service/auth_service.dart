import 'package:cvcar_mobile/app/api/api.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  ApiClient apiClient;

  AuthService({required this.apiClient});

  Future<void> login() async {
    await apiClient.login();
  }

  Future<void> logout(String idToken) async {
    await apiClient.logout(idToken);
  }
}
