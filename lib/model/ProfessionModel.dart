// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

ProfessionModel welcomeFromMap(String str) => ProfessionModel.fromMap(json.decode(str));

String welcomeToMap(ProfessionModel data) => json.encode(data.toMap());

class ProfessionModel {
  ProfessionModel({
    this.name,
    this.profession,
    this.description,
    this.contact,
  });

  final String name;
  final String profession;
  final int contact;
  final List<String> description;

  factory ProfessionModel.fromMap(Map<String, dynamic> json) => ProfessionModel(
    name: json["greeting"] == null ? null : json["greeting"],
    description: json["instructions"] == null ? null : List<String>.from(json["instructions"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "profession": profession == null ? null : profession,
    "contact": contact == null ? null : contact,
    "intro_message": description == null ? null : List<dynamic>.from(description.map((x) => x)),
  };
}
