import 'package:flutter/material.dart';

String? validateNotEmpty(value) {
  print("value: ${value.runtimeType}");
  return (value != null && value.isEmpty) ? "This field can't be empty" : null;
}

String? validatePassword(value) {
  // RegExp upperCaseRegex = RegExp(r'(?=.*?[A-Z])');
  // RegExp lowerCaseRegex = RegExp(r'(?=.*?[a-z])');
  // RegExp digitRegex = RegExp(r'(?=.*?[0-9])');
  // RegExp lengthRegex = RegExp(r'.{8,}');

  if (value.isEmpty) {
    return 'Please enter a password';
  }

  List<String> missingRequirements = [];

  // if (!upperCaseRegex.hasMatch(value)) {
  //   missingRequirements.add('at least one uppercase letter');
  // }

  // if (!lowerCaseRegex.hasMatch(value)) {
  //   missingRequirements.add('at least one lowercase letter');
  // }

  // if (!digitRegex.hasMatch(value)) {
  //   missingRequirements.add('at least one digit');
  // }

  // if (!lengthRegex.hasMatch(value)) {
  //   missingRequirements.add('at least 8 characters');
  // }

  if (missingRequirements.isNotEmpty) {
    return 'Password must contain ${missingRequirements.join(', ')}';
  } else {
    return null; // La contraseña es válida
  }
}

String? validateEmail(String? value) {
  RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  if (value == null || value.isEmpty) {
    return 'Please enter email';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null; // El correo electrónico es válido
    }
  }
}

String? validateVin(value) {
  if (value.length == 17 || value.length == 0) {
    return null;
  }
  return '17 characters required';
}

String? validateLessThanZero(value) {
  if (value != "") {
    if (int.parse(value) >= 0) {
      return null;
    }
    return 'minimum value: 0';
  }
  return "this field can't be empty";
}

String? validateYear(value) {
  if (value != "") {
    if (int.parse(value ?? 0) < 1989) {
      return 'Must be greater than 1989';
    }
    if (int.parse(value ?? 0) > 2100) {
      return 'Must be less than 2100';
    }
  }
  return null;
}

String? matchPasswords(
    {required TextEditingController passwordController, required value}) {
  if (passwordController.text != value) {
    return 'Password does not match!';
  }
  return null;
}

String? isValidEmail(value) {
  return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value)
      ? null
      : 'Email is not valid';
}
