import 'package:cvcar_mobile/app/models/register_user.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/service/user_service.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  UserService userService;
  RegisterController({required this.userService});

  final emailControllerRegister = TextEditingController().obs;
  final passControllerRegister = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  final documenType = TextEditingController().obs;
  final documenNumber = TextEditingController().obs;
  RxBool isPasswordObscure = true.obs;
  RxBool isConfirmPasswordObscure = true.obs;
  RxBool isLoading = false.obs;

  GlobalKey<FormState> formRegister = GlobalKey<FormState>();
  bool isValidFormCreateDriverOne() {
    return formRegister.currentState!.validate();
  }

  List<DropdownMenuItem<String>> documenTypeItemList = [
    const DropdownMenuItem(
      child: Text('Cédula de ciudadanía'),
      value: 'CC',
    ),
    // const DropdownMenuItem(
    //   child: Text('Cédula de extranjería'),
    //   value: 'CE',
    // ),
    // const DropdownMenuItem(
    //   child: Text('Pasaporte'),
    //   value: 'PP',
    // ),
    // const DropdownMenuItem(
    //   child: Text('Tarjeta de identidad'),
    // ),
    // const DropdownMenuItem(
    //   child: Text('Registro civil'),
    // ),
    // const DropdownMenuItem(
    //   child: Text('NIT'),
    // ),
    // const DropdownMenuItem(
    //   child: Text('RUT'),
    // ),
  ];
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

  seePassword() {
    return isPasswordObscure.value
        ? IconButton(
            onPressed: () {
              isPasswordObscure.value = false;
            },
            icon: const Icon(
              Icons.visibility,
              color: Color(CVCarColors.greyLight),
            ))
        : IconButton(
            onPressed: () {
              isPasswordObscure.value = true;
            },
            icon: const Icon(
              Icons.visibility_off,
              color: Color(CVCarColors.greyLight),
            ),
          );
  }

  seeConfirmPassword() {
    return isConfirmPasswordObscure.value
        ? IconButton(
            onPressed: () {
              isConfirmPasswordObscure.value = false;
            },
            icon: const Icon(
              Icons.visibility,
              color: Color(CVCarColors.greyLight),
            ))
        : IconButton(
            onPressed: () {
              isConfirmPasswordObscure.value = true;
            },
            icon: const Icon(
              Icons.visibility_off,
              color: Color(CVCarColors.greyLight),
            ),
          );
  }

  void register() async {
    isLoading.value = true;
    // User user = User(
    //     email: "alfredo123.apne@gmail.com",
    //     password: "12Febrero",
    //     confirmPassword: "12Febrero",
    //     numberDocument: "1192796999",
    //     documentType: "CC");

    RegisterUser user = RegisterUser(
      email: emailControllerRegister.value.text,
      password: passControllerRegister.value.text,
      confirmPassword: confirmPassController.value.text,
      documentType: documenType.value.text,
      numberDocument: documenNumber.value.text,
    );
    print(user.toJson());

    if (isValidFormCreateDriverOne()) {
      try {
        Response? response = await userService.createUser(user);
        print("response.bodyr: ${response.toString()}");

        if (response!.status.code! >= 200 && response.status.code! < 300) {
          print("AQUI ENTRAAA");
          isLoading.value = false;
          Get.snackbar("Registro exitoso",
              "Verifique su correo electrónico para poder ingresar",
              backgroundColor: Colors.green,
              colorText: Colors.white, onTap: (v) {
            Get.offAllNamed(Routes.LOGIN);
          });
          Get.offAllNamed(Routes.LOGIN);
        } else {
          isLoading.value = false;
          Get.snackbar(
            "Error",
            response.body["message"].toString(),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        isLoading.value = false;
        print(e);
      }
    }
    isLoading.value = false;
  }
}
