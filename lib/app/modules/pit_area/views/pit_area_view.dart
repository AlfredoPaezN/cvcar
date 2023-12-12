import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pit_area_controller.dart';

class PitAreaView extends GetView<PitAreaController> {
  const PitAreaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PitAreaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PitAreaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
