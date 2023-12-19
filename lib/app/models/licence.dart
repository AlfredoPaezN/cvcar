import 'dart:convert';

import 'package:cvcar_mobile/app/models/authoritty_transit.dart';
import 'package:cvcar_mobile/app/models/detail.dart';

class Licence {
  final String id;
  final dynamic observations;
  final dynamic description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final int state;
  final String licenceDrivingNumber;
  final DateTime dateExpedition;
  final String restrictions;
  final Entity authorityTransit;
  final List<Detail> details;

  Licence({
    required this.id,
    required this.observations,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.state,
    required this.licenceDrivingNumber,
    required this.dateExpedition,
    required this.restrictions,
    required this.authorityTransit,
    required this.details,
  });

  Licence copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    String? licenceDrivingNumber,
    DateTime? dateExpedition,
    String? restrictions,
    Entity? authorityTransit,
    List<Detail>? details,
  }) =>
      Licence(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        licenceDrivingNumber: licenceDrivingNumber ?? this.licenceDrivingNumber,
        dateExpedition: dateExpedition ?? this.dateExpedition,
        restrictions: restrictions ?? this.restrictions,
        authorityTransit: authorityTransit ?? this.authorityTransit,
        details: details ?? this.details,
      );

  factory Licence.fromRawJson(String str) => Licence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Licence.fromJson(Map<String, dynamic> json) => Licence(
        id: json["id"],
        observations: json["observations"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        state: json["state"],
        licenceDrivingNumber: json["licenceDrivingNumber"],
        dateExpedition: DateTime.parse(json["dateExpedition"]),
        restrictions: json["restrictions"],
        authorityTransit: Entity.fromJson(json["authorityTransit"]),
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "licenceDrivingNumber": licenceDrivingNumber,
        "dateExpedition":
            "${dateExpedition.year.toString().padLeft(4, '0')}-${dateExpedition.month.toString().padLeft(2, '0')}-${dateExpedition.day.toString().padLeft(2, '0')}",
        "restrictions": restrictions,
        "authorityTransit": authorityTransit.toJson(),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}
