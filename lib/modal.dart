// To parse this JSON data, do
//
//      applicationNew = applicationNewFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ApplicationNew applicationNewFromJsonlate(String str) =>
    ApplicationNew.fromJson(json.decode(str));

String applicationNewToJson(ApplicationNew data) => json.encode(data.toJson());

class ApplicationNew {
  ApplicationNew({
    required this.data,
  });

  ServerData data;

  factory ApplicationNew.fromJson(Map<String, dynamic> json) => ApplicationNew(
        data: ServerData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ServerData {
  ServerData({
    required this.name,
    // required this.post,
    required this.email,
    required this.password,
    required this.number,
    required this.address,
    // required this.qualification,
    // required this.gender,
  });

  late String name;
  //late String post;
  late String email;
  late String password;
  late String number;
  late String address;
  // late String qualification;
  // late String gender;

  ServerData.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    //post = json["post"];
    email = json["email"];
    password = json["password"];
    number = json["number"];
    address = json["address"];
    // qualification = json["qualification"];
    // gender = json["gender"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        // "post": post,
        "email": email,
        "password": password,
        "number": number,
        "address": address,
        // "qualification": qualification,
        // "gender": gender,
      };
}
