import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/isotipo_color.png',
          height: 26,
          width: 44,
        ),
        centerTitle: true,
        shadowColor: Color.fromARGB(0, 255, 0, 0),
        backgroundColor: Color.fromARGB(255, 16, 24, 32),
      ),
      body: SingleChildScrollView(child: Container()),
    );
  }
}
