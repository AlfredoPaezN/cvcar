import 'package:cvcar_mobile/app/api/api.dart';
import 'package:cvcar_mobile/app/models/data.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  ApiClient apiClient;

  AuthService({required this.apiClient});

  Future<Response> login(String email, String pass) async {
    return await apiClient.login(email, pass);
  }

  Future<void> logout(String idToken) async {
    await apiClient.logout(idToken);
  }
}
