import 'dart:convert';

class VehicleLine {
  final String? id;
  final dynamic observations;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? state;
  final String? name;
  final int? numberDoors;
  final String? grossWeight;
  final String? loadCapacity;
  final int? numberAxes;
  final int? passengerCapacity;
  final int? passengerCapacitySeated;

  VehicleLine({
    this.id,
    this.observations,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
    this.name,
    this.numberDoors,
    this.grossWeight,
    this.loadCapacity,
    this.numberAxes,
    this.passengerCapacity,
    this.passengerCapacitySeated,
  });

  VehicleLine copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    String? name,
    int? numberDoors,
    String? grossWeight,
    String? loadCapacity,
    int? numberAxes,
    int? passengerCapacity,
    int? passengerCapacitySeated,
  }) =>
      VehicleLine(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        name: name ?? this.name,
        numberDoors: numberDoors ?? this.numberDoors,
        grossWeight: grossWeight ?? this.grossWeight,
        loadCapacity: loadCapacity ?? this.loadCapacity,
        numberAxes: numberAxes ?? this.numberAxes,
        passengerCapacity: passengerCapacity ?? this.passengerCapacity,
        passengerCapacitySeated:
            passengerCapacitySeated ?? this.passengerCapacitySeated,
      );

  factory VehicleLine.fromRawJson(String str) =>
      VehicleLine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleLine.fromJson(Map<String, dynamic> json) => VehicleLine(
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
        name: json["name"],
        numberDoors: json["numberDoors"],
        grossWeight: json["grossWeight"],
        loadCapacity: json["loadCapacity"],
        numberAxes: json["numberAxes"],
        passengerCapacity: json["passengerCapacity"],
        passengerCapacitySeated: json["passengerCapacitySeated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "name": name,
        "numberDoors": numberDoors,
        "grossWeight": grossWeight,
        "loadCapacity": loadCapacity,
        "numberAxes": numberAxes,
        "passengerCapacity": passengerCapacity,
        "passengerCapacitySeated": passengerCapacitySeated,
      };
}
