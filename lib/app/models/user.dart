import 'dart:convert';

import 'package:cvcar_mobile/app/models/role.dart';

class User {
  final String? id;
  final dynamic observations;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? state;
  final String? firstName;
  final String? lastName;
  final String? email;
  final dynamic phone;
  final String? numberDocument;
  final String? documentType;
  final dynamic address;
  final dynamic city;
  final List<Role>? roles;

  User({
    this.id,
    this.observations,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.numberDocument,
    this.documentType,
    this.address,
    this.city,
    this.roles,
  });

  User copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    String? firstName,
    String? lastName,
    String? email,
    dynamic phone,
    String? numberDocument,
    String? documentType,
    dynamic address,
    dynamic city,
    List<Role>? roles,
  }) =>
      User(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        numberDocument: numberDocument ?? this.numberDocument,
        documentType: documentType ?? this.documentType,
        address: address ?? this.address,
        city: city ?? this.city,
        roles: roles ?? this.roles,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        observations: json["observations"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        state: json["state"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        numberDocument: json["numberDocument"],
        documentType: json["documentType"],
        address: json["address"],
        city: json["city"],
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "numberDocument": numberDocument,
        "documentType": documentType,
        "address": address,
        "city": city,
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}
