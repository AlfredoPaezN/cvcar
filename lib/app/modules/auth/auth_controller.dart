import 'package:cvcar_mobile/app/global/custom_snack.dart';
import 'package:cvcar_mobile/app/models/driving.dart';
import 'package:cvcar_mobile/app/models/register_user.dart';
import 'package:cvcar_mobile/app/models/user.dart';
import 'package:cvcar_mobile/app/models/vehicle.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/service/auth_service.dart';
import 'package:cvcar_mobile/app/service/user_service.dart';
import 'package:cvcar_mobile/app/utils/handle_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxService {
  AuthController({required this.authService, required this.userService});

  AuthService authService;
  UserService userService;

  RxInt vehicleSelected = 0.obs;

  Rxn<User> user = Rxn<User>();
  Rxn<ImageProvider> driverImage = Rxn<ImageProvider>();

  RxMap userPermission = {}.obs;
  RxList modulePermission = [].obs;

  Rxn<Driving> drivinData = Rxn<Driving>();
  Rxn<User> userData = Rxn<User>();
  Rxn<List<Vehicle>> vehiclesData = Rxn<List<Vehicle>>();

  Rx<bool> isImageLoading = false.obs;
  Rx<bool> isUserLoaded = false.obs;
  Rx<bool> isLogoutLoaded = false.obs;
  Rx<bool> isCompanyLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    GetStorage box = GetStorage();
    String? accessToken = box.read('access_token');

    if (accessToken != null) {
      // await getUserProfile();
      await getUserPermission();

      // loadImage();
    }
  }

  Future<void> login(String email, String pass) async {
    Response response = await authService.login(email, pass);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        drivinData.value = Driving.fromJson(response.body['driving']);
        userData.value = User.fromJson(response.body['user']);
        List<dynamic> vehicleList = response.body['vehicles'] ?? [];
        if (vehicleList.isNotEmpty) {
          vehiclesData.value =
              vehicleList.map((vehicle) => Vehicle.fromJson(vehicle)).toList();
        }
        Get.toNamed(Routes.WELCOME);
      } catch (e) {
        errorMessage(
            '${response.body['message']}', 'Por favor intentalo de nuevo.');
      }
    } else {
      errorMessage(
          '${response.body['message']}', 'Por favor intentalo de nuevo .');
    }
  }

  // void loadImage() {
  //   if (user.value?.image != null) {
  //     driverImage.value = Image.memory(
  //       Uri.parse(user.value!.image!).data!.contentAsBytes(),
  //     ).image;
  //   } else {
  //     driverImage.value = Image.asset(
  //       "assets/images/default_user.png",
  //     ).image;
  //   }
  // }

  Future<void> logout() async {
    try {
      isLogoutLoaded.value = true;
      var box = GetStorage();
      String idToken = box.read('id_token');
      await authService.logout(idToken);
      user.value = null;
      isLogoutLoaded.value = false;
    } catch (e) {
      isLogoutLoaded.value = false;
      // showDefaultErrorMessage(e);
    }
  }

  // Future<void> getUserProfile() async {
  //   try {
  //     user.value = await userService.getUserProfile();
  //   } catch (e, t) {
  //     handleError(e, t);
  //   }
  //   isUserLoaded.value = true;
  // }

  Future<void> getUserPermission() async {
    try {
      userPermission.value = await userService.getUserPermission();
      GetStorage box = GetStorage();
      box.write("ModulePermissions", userPermission["ModulePermissions"]);
      modulePermission.value = userPermission["ModulePermissions"];
    } catch (e, t) {
      handleError(e, t);
    }
  }

  // Future<Response?> updateUserProfile(User user) async {
  //   try {
  //     Response data = await userService.updateUserProfile(user);
  //     if (data.status.code == 200) {
  //       this.user.value = user;
  //     }
  //     return data;
  //   } catch (e, t) {
  //     handleError(e, t);
  //   }
  //   return null;
  // }

  Future<Response?> createUser(RegisterUser user) async {
    try {
      Response data = await userService.createUser(user) ??
          const Response(statusText: "Algo salio mal");
      return data;
    } catch (e, t) {
      handleError(e, t);
    }
    return null;
  }

  // Future<Response?> updateUserProfileImage(image) async {
  //   try {
  //     Response data = await userService.updateUserProfileImage(image);
  //     return data;
  //   } catch (e, t) {
  //     handleError(e, t);
  //   }
  //   return null;
  // }
}
