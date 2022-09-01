// To parse this JSON data, do
//
//     final loginApiModel = loginApiModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginApiModel loginApiModelFromJson(String str) => LoginApiModel.fromJson(json.decode(str));

String loginApiModelToJson(LoginApiModel data) => json.encode(data.toJson());

class LoginApiModel {
    LoginApiModel({
        required this.data,
    });

    Data data;

    factory LoginApiModel.fromJson(Map<String, dynamic> json) => LoginApiModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.profilePic,
        required this.name,
        required this.emailId,
    });

    String profilePic;
    String name;
    String emailId;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        profilePic: json["profile_pic"],
        name: json["name"],
        emailId: json["email_id"],
    );

    Map<String, dynamic> toJson() => {
        "profile_pic": profilePic,
        "name": name,
        "email_id": emailId,
    };
}
