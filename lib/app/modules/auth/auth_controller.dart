import 'package:cvcar_mobile/app/global/custom_snack.dart';
import 'package:cvcar_mobile/app/models/user.dart';
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

  Rxn<User> user = Rxn<User>();
  Rxn<ImageProvider> driverImage = Rxn<ImageProvider>();

  RxMap userPermission = {}.obs;

  RxList modulePermission = [].obs;

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
      await getUserProfile();
      await getUserPermission();

      // loadImage();
    }
  }

  Future<bool> login() async {
    try {
      await authService.login();
      return true;
    } catch (e) {
      errorMessage('There was a problem.', 'Please try to login again.');
      return false;
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

  Future<void> getUserProfile() async {
    try {
      user.value = await userService.getUserProfile();
    } catch (e, t) {
      handleError(e, t);
    }
    isUserLoaded.value = true;
  }

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

  Future<Response?> updateUserProfile(User user) async {
    try {
      Response data = await userService.updateUserProfile(user);
      if (data.status.code == 200) {
        this.user.value = user;
      }
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
