import 'dart:convert';

import 'package:cvcar_mobile/app/models/authoritty_transit.dart';
import 'package:cvcar_mobile/app/models/driving.dart';
import 'package:cvcar_mobile/app/models/soat.dart';
import 'package:cvcar_mobile/app/models/vehicle_line.dart';

class Vehicle {
  final String? id;
  final dynamic observations;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? state;
  final String? numberIdentificationOwner;
  final String? numberIdentificationUser;
  final bool? encumbrancesProperty;
  final bool? classicAntique;
  final bool? repowering;
  final bool? rerecordingEngine;
  final String? nroRecordingEngine;
  final bool? rerecordingChassis;
  final bool? rerecordingSeries;
  final String? chassisNumber;
  final int? cylinderCapacity;
  final bool? regrabacionVin;
  final int? modelYear;
  final String? motorNumber;
  final String? numberTransitLicense;
  final String? plate;
  final String? serialNumber;
  final String? vehicleIdentificationNumber;
  final DateTime? dateInitialEnrollment;
  final Entity? color;
  final Entity? authorityTransit;
  final VehicleLine? vehicleLine;
  final Entity? typeService;
  final Entity? vehicleTypeFuel;
  final Driving? driving;
  final Entity? brand;
  final Entity? vehicleClass;
  final List<Soat>? tecnomechanics;
  final List<Soat>? soats;

  Vehicle({
    this.id,
    this.observations,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
    this.numberIdentificationOwner,
    this.numberIdentificationUser,
    this.encumbrancesProperty,
    this.classicAntique,
    this.repowering,
    this.rerecordingEngine,
    this.nroRecordingEngine,
    this.rerecordingChassis,
    this.rerecordingSeries,
    this.chassisNumber,
    this.cylinderCapacity,
    this.regrabacionVin,
    this.modelYear,
    this.motorNumber,
    this.numberTransitLicense,
    this.plate,
    this.serialNumber,
    this.vehicleIdentificationNumber,
    this.dateInitialEnrollment,
    this.color,
    this.authorityTransit,
    this.vehicleLine,
    this.typeService,
    this.vehicleTypeFuel,
    this.driving,
    this.brand,
    this.vehicleClass,
    this.tecnomechanics,
    this.soats,
  });

  Vehicle copyWith({
    String? id,
    dynamic observations,
    dynamic description,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    int? state,
    String? numberIdentificationOwner,
    String? numberIdentificationUser,
    bool? encumbrancesProperty,
    bool? classicAntique,
    bool? repowering,
    bool? rerecordingEngine,
    String? nroRecordingEngine,
    bool? rerecordingChassis,
    bool? rerecordingSeries,
    String? chassisNumber,
    int? cylinderCapacity,
    bool? regrabacionVin,
    int? modelYear,
    String? motorNumber,
    String? numberTransitLicense,
    String? plate,
    String? serialNumber,
    String? vehicleIdentificationNumber,
    DateTime? dateInitialEnrollment,
    Entity? color,
    Entity? authorityTransit,
    VehicleLine? vehicleLine,
    Entity? typeService,
    Entity? vehicleTypeFuel,
    Driving? driving,
    Entity? brand,
    Entity? vehicleClass,
    List<Soat>? tecnomechanics,
    List<Soat>? soats,
  }) =>
      Vehicle(
        id: id ?? this.id,
        observations: observations ?? this.observations,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        state: state ?? this.state,
        numberIdentificationOwner:
            numberIdentificationOwner ?? this.numberIdentificationOwner,
        numberIdentificationUser:
            numberIdentificationUser ?? this.numberIdentificationUser,
        encumbrancesProperty: encumbrancesProperty ?? this.encumbrancesProperty,
        classicAntique: classicAntique ?? this.classicAntique,
        repowering: repowering ?? this.repowering,
        rerecordingEngine: rerecordingEngine ?? this.rerecordingEngine,
        nroRecordingEngine: nroRecordingEngine ?? this.nroRecordingEngine,
        rerecordingChassis: rerecordingChassis ?? this.rerecordingChassis,
        rerecordingSeries: rerecordingSeries ?? this.rerecordingSeries,
        chassisNumber: chassisNumber ?? this.chassisNumber,
        cylinderCapacity: cylinderCapacity ?? this.cylinderCapacity,
        regrabacionVin: regrabacionVin ?? this.regrabacionVin,
        modelYear: modelYear ?? this.modelYear,
        motorNumber: motorNumber ?? this.motorNumber,
        numberTransitLicense: numberTransitLicense ?? this.numberTransitLicense,
        plate: plate ?? this.plate,
        serialNumber: serialNumber ?? this.serialNumber,
        vehicleIdentificationNumber:
            vehicleIdentificationNumber ?? this.vehicleIdentificationNumber,
        dateInitialEnrollment:
            dateInitialEnrollment ?? this.dateInitialEnrollment,
        color: color ?? this.color,
        authorityTransit: authorityTransit ?? this.authorityTransit,
        vehicleLine: vehicleLine ?? this.vehicleLine,
        typeService: typeService ?? this.typeService,
        vehicleTypeFuel: vehicleTypeFuel ?? this.vehicleTypeFuel,
        driving: driving ?? this.driving,
        brand: brand ?? this.brand,
        vehicleClass: vehicleClass ?? this.vehicleClass,
        tecnomechanics: tecnomechanics ?? this.tecnomechanics,
        soats: soats ?? this.soats,
      );

  factory Vehicle.fromRawJson(String str) => Vehicle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
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
        numberIdentificationOwner: json["numberIdentificationOwner"],
        numberIdentificationUser: json["numberIdentificationUser"],
        encumbrancesProperty: json["encumbrancesProperty"],
        classicAntique: json["classicAntique"],
        repowering: json["repowering"],
        rerecordingEngine: json["rerecordingEngine"],
        nroRecordingEngine: json["nroRecordingEngine"],
        rerecordingChassis: json["rerecordingChassis"],
        rerecordingSeries: json["rerecordingSeries"],
        chassisNumber: json["chassisNumber"],
        cylinderCapacity: json["cylinderCapacity"],
        regrabacionVin: json["regrabacionVin"],
        modelYear: json["modelYear"],
        motorNumber: json["motorNumber"],
        numberTransitLicense: json["numberTransitLicense"],
        plate: json["plate"],
        serialNumber: json["serialNumber"],
        vehicleIdentificationNumber: json["vehicleIdentificationNumber"],
        dateInitialEnrollment: json["dateInitialEnrollment"] == null
            ? null
            : DateTime.parse(json["dateInitialEnrollment"]),
        color: json["color"] == null ? null : Entity.fromJson(json["color"]),
        authorityTransit: json["authorityTransit"] == null
            ? null
            : Entity.fromJson(json["authorityTransit"]),
        vehicleLine: json["vehicleLine"] == null
            ? null
            : VehicleLine.fromJson(json["vehicleLine"]),
        typeService: json["typeService"] == null
            ? null
            : Entity.fromJson(json["typeService"]),
        vehicleTypeFuel: json["vehicleTypeFuel"] == null
            ? null
            : Entity.fromJson(json["vehicleTypeFuel"]),
        driving:
            json["driving"] == null ? null : Driving.fromJson(json["driving"]),
        brand: json["brand"] == null ? null : Entity.fromJson(json["brand"]),
        vehicleClass:
            json["class"] == null ? null : Entity.fromJson(json["class"]),
        tecnomechanics: json["tecnomechanics"] == null
            ? []
            : List<Soat>.from(
                json["tecnomechanics"]!.map((x) => Soat.fromJson(x))),
        soats: json["soats"] == null
            ? []
            : List<Soat>.from(json["soats"]!.map((x) => Soat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "observations": observations,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "state": state,
        "numberIdentificationOwner": numberIdentificationOwner,
        "numberIdentificationUser": numberIdentificationUser,
        "encumbrancesProperty": encumbrancesProperty,
        "classicAntique": classicAntique,
        "repowering": repowering,
        "rerecordingEngine": rerecordingEngine,
        "nroRecordingEngine": nroRecordingEngine,
        "rerecordingChassis": rerecordingChassis,
        "rerecordingSeries": rerecordingSeries,
        "chassisNumber": chassisNumber,
        "cylinderCapacity": cylinderCapacity,
        "regrabacionVin": regrabacionVin,
        "modelYear": modelYear,
        "motorNumber": motorNumber,
        "numberTransitLicense": numberTransitLicense,
        "plate": plate,
        "serialNumber": serialNumber,
        "vehicleIdentificationNumber": vehicleIdentificationNumber,
        "dateInitialEnrollment":
            "${dateInitialEnrollment!.year.toString().padLeft(4, '0')}-${dateInitialEnrollment!.month.toString().padLeft(2, '0')}-${dateInitialEnrollment!.day.toString().padLeft(2, '0')}",
        "color": color?.toJson(),
        "authorityTransit": authorityTransit?.toJson(),
        "vehicleLine": vehicleLine?.toJson(),
        "typeService": typeService?.toJson(),
        "vehicleTypeFuel": vehicleTypeFuel?.toJson(),
        "driving": driving?.toJson(),
        "brand": brand?.toJson(),
        "class": vehicleClass?.toJson(),
        "tecnomechanics": tecnomechanics == null
            ? []
            : List<dynamic>.from(tecnomechanics!.map((x) => x.toJson())),
        "soats": soats == null
            ? []
            : List<dynamic>.from(soats!.map((x) => x.toJson())),
      };
}
