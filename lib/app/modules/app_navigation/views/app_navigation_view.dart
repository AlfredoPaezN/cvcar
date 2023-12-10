import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/app_navigation_controller.dart';

class AppNavigationView extends GetView<AppNavigationController> {
  const AppNavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppNavigationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AppNavigationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
