import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

handleError(e, stackTrace) async {
  GetStorage box = GetStorage();

  final accessToken = box.read('access_token');
  if (accessToken == null) {
    Get.snackbar('Error', 'Oops error has ocurred $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white);

    log(
      'Error:',
      error: e,
      stackTrace: stackTrace,
    );
  }
}

void printWarning(String text) {
  log('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  log('\x1B[31m$text\x1B[0m');
}
