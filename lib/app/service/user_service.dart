import 'dart:convert';

import 'package:cvcar_mobile/app/api/api.dart';
import 'package:cvcar_mobile/app/api/api_routes.dart';
import 'package:cvcar_mobile/app/models/register_user.dart';
import 'package:cvcar_mobile/app/utils/handle_error.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class UserService extends GetxController {
  ApiClient apiClient;
  UserService({required this.apiClient});

  // Future<User?> getUserProfile() async {
  //   Response? response = await apiClient.getData(ApiRoutes.USER_PROFILE);
  //   return response.body != null ? User.fromJson(response.body) : null;
  // }

  Future<Map<String, dynamic>> getUserPermission() async {
    try {
      Response response = await apiClient.getData(ApiRoutes.USER_PERMISSION);
      if (response.body != null) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return jsonMap;
      }
    } catch (e, s) {
      handleError(e, s);
    }
    return {};
  }

  Future<Response?> createUser(RegisterUser user) async {
    print("ApiRoutes.CREATE_USER: ${ApiRoutes.PROD_BASE_URL}${ApiRoutes.USER}");
    try {
      Response response = await apiClient.postData(
          "${ApiRoutes.PROD_BASE_URL}${ApiRoutes.USER}", user.toJson());
      print("response.body: ${response.body}");
      return response;
    } catch (e, s) {
      handleError(e, s);
    }
    return null;
  }

  // Future<http.Response?> deleteUserAccount() async {
  //   http.Response? response;
  //   try {
  //     Uri uri = Uri.parse("${AuthKeys.DEV_ISSUER}/${AuthKeys.DELETE_ACCOUNT}");

  //     response = await http.delete(uri, headers: {
  //       "Authorization":
  //           "Bearer ddYPvRuKQ12DhFDHXcJ_Uk:APA91bFxHDTtwAz32uk3C9ZFCw7Ma-RTC92df42t7IT7jPkzTy6TeLUVCnvQ9qIgf9VXt4TXyLyXQb0nPmg44RfCPXyuh8k9YQTZYEG8faBBCPZ8yGHdcYMuqbw7JzYLVD9K5DIQyUm9"
  //     });
  //     return response;
  //   } catch (e, s) {
  //     handleError(e, s);
  //   }
  //   return response;
  // }

  // Future<Response> updateUserProfile(User user) async {
  //   Response response =
  //       await apiClient.postData(ApiRoutes.USER_PROFILE, user.toJson());
  //   return response;
  // }
}
