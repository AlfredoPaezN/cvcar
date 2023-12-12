import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
  const ReservationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReservationsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReservationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
