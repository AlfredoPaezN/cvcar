import 'dart:convert';

class Entity {
  final String id;
  final dynamic observations;
  final dynamic description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final int state;
  final String name;

  Entity({
    required this.id,
    required this.observations,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.state,
    required this.name,
  });

  Entity copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    String? name,
  }) =>
      Entity(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        name: name ?? this.name,
      );

  factory Entity.fromRawJson(String str) => Entity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        id: json["id"],
        observations: json["observations"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        state: json["state"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "name": name,
      };
}
