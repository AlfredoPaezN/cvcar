import 'dart:convert';

class User {
  final String email;
  final String password;
  final String confirmPassword;
  final String numberDocument;
  final String documentType;

  User({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.numberDocument,
    required this.documentType,
  });

  User copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? numberDocument,
    String? documentType,
  }) =>
      User(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        numberDocument: numberDocument ?? this.numberDocument,
        documentType: documentType ?? this.documentType,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
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
