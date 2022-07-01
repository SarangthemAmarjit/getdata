// To parse this JSON data, do
//
//     final applicationNew = applicationNewFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ApplicationNew applicationNewFromJson(String str) =>
    ApplicationNew.fromJson(json.decode(str));

String applicationNewToJson(ApplicationNew data) => json.encode(data.toJson());

class ApplicationNew {
  ApplicationNew({
    required this.data,
    required this.meta,
  });

  final Data data;
  final Meta meta;

  factory ApplicationNew.fromJson(Map<String, dynamic> json) => ApplicationNew(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  final int id;
  final Attributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.name,
    required this.email,
    required this.number,
    required this.address,
    required this.dataOfBirth,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  final String name;
  final String email;
  final String number;
  final String address;
  final DateTime dataOfBirth;
  final String gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        email: json["email"],
        number: json["number"],
        address: json["address"],
        dataOfBirth: DateTime.parse(json["data_of_birth"]),
        gender: json["gender"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "number": number,
        "address": address,
        "data_of_birth":
            "${dataOfBirth.year.toString().padLeft(4, '0')}-${dataOfBirth.month.toString().padLeft(2, '0')}-${dataOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
