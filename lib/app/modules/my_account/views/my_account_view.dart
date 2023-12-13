import 'package:cvcar_mobile/app/font/title.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/logo/logo_completo.png",
              width: 200,
            ),
            Image.asset(
              'assets/categories/construccion.png',
              width: 2400,
            ),
            const Label(label: "Pagina en construcción")
          ],
        ),
      ),
    );
  }
}
