import 'dart:convert';

class Role {
  final String? id;
  final String? name;

  Role({
    this.id,
    this.name,
  });

  Role copyWith({
    String? id,
    String? name,
  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
