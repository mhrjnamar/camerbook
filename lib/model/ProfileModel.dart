// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

String welcomeToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
  ProfileModel({
    this.name,
    this.email,
    this.contact,
    this.pincode,
    this.state,

  });

  final String name;
  final String email;
  final int contact;
  final int pincode;
  final String state;


  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "contact": contact == null ? null : contact,
    "pincode":  pincode,
    "state": state == null ? null : state,

  };

}
