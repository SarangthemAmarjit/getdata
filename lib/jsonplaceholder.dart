// To parse this JSON data, do
//
//     final jsonPlaceHolder = jsonPlaceHolderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<JsonPlaceHolder> jsonPlaceHolderFromJson(String str) =>
    List<JsonPlaceHolder>.from(
        json.decode(str).map((x) => JsonPlaceHolder.fromJson(x)));

String jsonPlaceHolderToJson(List<JsonPlaceHolder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JsonPlaceHolder {
  JsonPlaceHolder({
    required this.userId,
    required this.id,
    required this.title,
  });

  final int userId;
  final int id;
  final String title;

  factory JsonPlaceHolder.fromJson(Map<String, dynamic> json) =>
      JsonPlaceHolder(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
