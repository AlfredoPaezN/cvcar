import 'dart:convert';

import 'package:cvcar_mobile/app/models/authoritty_transit.dart';

class Detail {
  final String? id;
  final dynamic observations;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? state;
  final DateTime? dateExpedition;
  final DateTime? dateExpiration;
  final DateTime? dateExpirationExam;
  final Entity? drivingCategory;

  Detail({
    this.id,
    this.observations,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
    this.dateExpedition,
    this.dateExpiration,
    this.dateExpirationExam,
    this.drivingCategory,
  });

  Detail copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    DateTime? dateExpedition,
    DateTime? dateExpiration,
    DateTime? dateExpirationExam,
    Entity? drivingCategory,
  }) =>
      Detail(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        dateExpedition: dateExpedition ?? this.dateExpedition,
        dateExpiration: dateExpiration ?? this.dateExpiration,
        dateExpirationExam: dateExpirationExam ?? this.dateExpirationExam,
        drivingCategory: drivingCategory ?? this.drivingCategory,
      );

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
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
        dateExpedition: json["dateExpedition"] == null
            ? null
            : DateTime.parse(json["dateExpedition"]),
        dateExpiration: json["dateExpiration"] == null
            ? null
            : DateTime.parse(json["dateExpiration"]),
        dateExpirationExam: json["dateExpirationExam"] == null
            ? null
            : DateTime.parse(json["dateExpirationExam"]),
        drivingCategory: json["drivingCategory"] == null
            ? null
            : Entity.fromJson(json["drivingCategory"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "dateExpedition":
            "${dateExpedition!.year.toString().padLeft(4, '0')}-${dateExpedition!.month.toString().padLeft(2, '0')}-${dateExpedition!.day.toString().padLeft(2, '0')}",
        "dateExpiration":
            "${dateExpiration!.year.toString().padLeft(4, '0')}-${dateExpiration!.month.toString().padLeft(2, '0')}-${dateExpiration!.day.toString().padLeft(2, '0')}",
        "dateExpirationExam":
            "${dateExpirationExam!.year.toString().padLeft(4, '0')}-${dateExpirationExam!.month.toString().padLeft(2, '0')}-${dateExpirationExam!.day.toString().padLeft(2, '0')}",
        "drivingCategory": drivingCategory?.toJson(),
      };
}
