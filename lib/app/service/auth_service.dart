import 'package:cvcar_mobile/app/api/api.dart';
import 'package:cvcar_mobile/app/api/api_routes.dart';
import 'package:cvcar_mobile/app/utils/handle_error.dart';

import 'package:get/get.dart';

class AuthService extends GetxService {
  ApiClient apiClient;

  AuthService({required this.apiClient});

  Future<Response> login(String email, String pass) async {
    return await apiClient.login(email, pass);
  }

  Future<void> logout() async {
    await apiClient.logout();
  }

  Future<Response> deleteAccount() async {
    print("ApiRoutes.CREATE_USER: ${ApiRoutes.PROD_BASE_URL}${ApiRoutes.USER}");
    try {
      Response response = await apiClient
          .deleteData("${ApiRoutes.PROD_BASE_URL}${ApiRoutes.USER}");
      print("response.body: ${response.body}");
      return response;
    } catch (e, s) {
      handleError(e, s);
      return Response(statusCode: 500, body: e.toString());
    }
  }
}
