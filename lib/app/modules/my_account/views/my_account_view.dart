import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyAccountView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
