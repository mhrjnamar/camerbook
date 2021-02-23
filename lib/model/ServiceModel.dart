
// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

ServiceModel welcomeFromMap(String str) => ServiceModel.fromMap(json.decode(str));

String welcomeToMap(ServiceModel data) => json.encode(data.toMap());

class ServiceModel {
  ServiceModel({
    this.name,
    this.url,
    this.description,

  });

  final String name;
  final String url;

  final List<String> description;

  factory ServiceModel.fromMap(Map<String, dynamic> json) => ServiceModel(
    name: json["greeting"] == null ? null : json["greeting"],
    description: json["instructions"] == null ? null : List<String>.from(json["instructions"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "service": name == null ? null : name,
    "url": url == null ? null : url,
    "details": description == null ? null : List<dynamic>.from(description.map((x) => x)),
  };
}
