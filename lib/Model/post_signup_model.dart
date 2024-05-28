import 'dart:convert';

PostSignupModel postSignupModelFromJson(String str) =>
    PostSignupModel.fromJson(json.decode(str));

String postSignupModelToJson(PostSignupModel data) =>
    json.encode(data.toJson());

class PostSignupModel {
  String? message;
  String? statusCode;
  Result? result;

  PostSignupModel({
    this.message,
    this.statusCode,
    this.result,
  });

  factory PostSignupModel.fromJson(Map<String, dynamic> json) =>
      PostSignupModel(
        message: json["Message"],
        statusCode: json["Status_code"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status_code": statusCode,
        "result": result?.toJson(),
      };
}

class Result {
  String? id;
  String? name;
  String? emailAddress;
  String? username;
  String? type;
  String? password;

  Result({
    this.id,
    this.name,
    this.emailAddress,
    this.username,
    this.type,
    this.password,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        emailAddress: json["email_address"],
        username: json["username"],
        type: json["type"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email_address": emailAddress,
        "username": username,
        "type": type,
        "password": password,
      };
}
