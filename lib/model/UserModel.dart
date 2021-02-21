// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

UserModel welcomeFromMap(String str) => UserModel.fromMap(json.decode(str));

String welcomeToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.uid,
    this.name,
    this.profession,
    this.description,
    this.contact,
  });
  final String uid;
  final String name;
  final String profession;
  final String contact;
  final List<String> description;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : List<String>.from(json["description"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "uid" : uid == null ? null : uid,
    "name": name == null ? null : name,
    "profession": profession == null ? null : profession,
    "contact": contact == null ? null : contact,
    "intro_message": description == null ? null : List<dynamic>.from(description.map((x) => x)),
  };
}
