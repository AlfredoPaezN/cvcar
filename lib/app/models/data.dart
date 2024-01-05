import 'package:cvcar_mobile/app/models/driving.dart';
import 'package:cvcar_mobile/app/models/user.dart';
import 'package:cvcar_mobile/app/models/vehicle.dart';
import 'dart:convert';

class LoginData {
  final String? token;
  final User? user;
  final Driving? driving;
  final List<Vehicle>? vehicles;

  LoginData({
    this.token,
    this.user,
    this.driving,
    this.vehicles,
  });

  LoginData copyWith({
    String? token,
    User? user,
    Driving? driving,
    List<Vehicle>? vehicles,
  }) =>
      LoginData(
        token: token ?? this.token,
        user: user ?? this.user,
        driving: driving ?? this.driving,
        vehicles: vehicles ?? this.vehicles,
      );

  factory LoginData.fromRawJson(String str) =>
      LoginData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        driving:
            json["driving"] == null ? null : Driving.fromJson(json["driving"]),
        vehicles: json["vehicles"] == null
            ? []
            : List<Vehicle>.from(
                json["vehicles"]!.map((x) => Vehicle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
        "driving": driving?.toJson(),
        "vehicles": vehicles == null
            ? []
            : List<dynamic>.from(vehicles!.map((x) => x.toJson())),
      };
}
