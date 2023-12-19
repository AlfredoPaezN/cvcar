import 'dart:convert';

class RegisterUser {
  final String email;
  final String password;
  final String confirmPassword;
  final String numberDocument;
  final String documentType;

  RegisterUser({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.numberDocument,
    required this.documentType,
  });

  RegisterUser copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? numberDocument,
    String? documentType,
  }) =>
      RegisterUser(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        numberDocument: numberDocument ?? this.numberDocument,
        documentType: documentType ?? this.documentType,
      );

  factory RegisterUser.fromRawJson(String str) =>
      RegisterUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        numberDocument: json["numberDocument"],
        documentType: json["documentType"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "numberDocument": numberDocument,
        "documentType": documentType,
      };
}
