import 'dart:convert';

import 'package:cvcar_mobile/app/models/authoritty_transit.dart';

class Soat {
  final String? id;
  final dynamic observations;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? state;
  final String? numberPolicy;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? dateExpedit;
  final Entity? agency;
  final String? certificateNumber;
  final DateTime? dateExpiry;
  final bool? isExpired;

  Soat({
    this.id,
    this.observations,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
    this.numberPolicy,
    this.startDate,
    this.endDate,
    this.dateExpedit,
    this.agency,
    this.certificateNumber,
    this.dateExpiry,
    this.isExpired,
  });

  Soat copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    String? numberPolicy,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? dateExpedit,
    Entity? agency,
    String? certificateNumber,
    DateTime? dateExpiry,
    bool? isExpired,
  }) =>
      Soat(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        numberPolicy: numberPolicy ?? this.numberPolicy,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        dateExpedit: dateExpedit ?? this.dateExpedit,
        agency: agency ?? this.agency,
        certificateNumber: certificateNumber ?? this.certificateNumber,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        isExpired: isExpired ?? this.isExpired,
      );

  factory Soat.fromRawJson(String str) => Soat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Soat.fromJson(Map<String, dynamic> json) => Soat(
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
        numberPolicy: json["numberPolicy"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        dateExpedit: json["dateExpedit"] == null
            ? null
            : DateTime.parse(json["dateExpedit"]),
        agency: json["agency"] == null ? null : Entity.fromJson(json["agency"]),
        certificateNumber: json["certificateNumber"],
        dateExpiry: json["dateExpiry"] == null
            ? null
            : DateTime.parse(json["dateExpiry"]),
        isExpired: json["isExpired"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "numberPolicy": numberPolicy,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "dateExpedit":
            "${dateExpedit!.year.toString().padLeft(4, '0')}-${dateExpedit!.month.toString().padLeft(2, '0')}-${dateExpedit!.day.toString().padLeft(2, '0')}",
        "agency": agency?.toJson(),
        "certificateNumber": certificateNumber,
        "dateExpiry":
            "${dateExpiry!.year.toString().padLeft(4, '0')}-${dateExpiry!.month.toString().padLeft(2, '0')}-${dateExpiry!.day.toString().padLeft(2, '0')}",
        "isExpired": isExpired,
      };
}
