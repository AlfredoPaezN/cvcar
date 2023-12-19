import 'dart:convert';

import 'package:cvcar_mobile/app/models/licence.dart';

class Driving {
  final String? id;
  final dynamic observations;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? state;
  final String? inscriptionNumber;
  final DateTime? inscriptionDate;
  final bool? hasFines;

  Driving({
    this.id,
    this.observations,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
    this.inscriptionNumber,
    this.inscriptionDate,
    this.hasFines,
  });

  Driving copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    String? inscriptionNumber,
    DateTime? inscriptionDate,
    bool? hasFines,
  }) =>
      Driving(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        inscriptionNumber: inscriptionNumber ?? this.inscriptionNumber,
        inscriptionDate: inscriptionDate ?? this.inscriptionDate,
        hasFines: hasFines ?? this.hasFines,
      );

  factory Driving.fromRawJson(String str) => Driving.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Driving.fromJson(Map<String, dynamic> json) => Driving(
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
        inscriptionNumber: json["inscriptionNumber"],
        inscriptionDate: json["inscriptionDate"] == null
            ? null
            : DateTime.parse(json["inscriptionDate"]),
        hasFines: json["hasFines"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "inscriptionNumber": inscriptionNumber,
        "inscriptionDate":
            "${inscriptionDate!.year.toString().padLeft(4, '0')}-${inscriptionDate!.month.toString().padLeft(2, '0')}-${inscriptionDate!.day.toString().padLeft(2, '0')}",
        "hasFines": hasFines,
      };
}
