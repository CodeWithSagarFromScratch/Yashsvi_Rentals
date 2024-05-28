import 'dart:convert';

PostLoginModel postLoginModelFromJson(String str) =>
    PostLoginModel.fromJson(json.decode(str));

String postLoginModelToJson(PostLoginModel data) => json.encode(data.toJson());

class PostLoginModel {
  String? statusCode;
  Result? result;
  String? message;

  PostLoginModel({this.statusCode, this.result, this.message});

  factory PostLoginModel.fromJson(Map<String, dynamic> json) => PostLoginModel(
    statusCode: json["Status_code"],
    result: Result.fromJson(json["result"]),
    message: json["Message"], // Changed "message" to "Message"
  );

  Map<String, dynamic> toJson() => {
    "Status_code": statusCode,
    "result": result?.toJson(),
    "Message": message,
  };
}

class Result {
  String? phone; // Changed "id" to "phone"
  String? empName; // Changed "name" to "empName"
  String? userType; // Changed "type" to "userType"
  String? loginId; // Changed "username" to "loginId"

  Result({
    this.phone,
    this.empName,
    this.userType,
    this.loginId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    phone: json["phone"],
    empName: json["emp_name"],
    userType: json["user_type"],
    loginId: json["login_id"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "emp_name": empName,
    "user_type": userType,
    "login_id": loginId,
  };
}
