import 'dart:convert';

PostCustomerModel postCustomerModelFromJson(String str) =>
    PostCustomerModel.fromJson(json.decode(str));

String postCustomerModelToJson(PostCustomerModel data) =>
    json.encode(data.toJson());

class PostCustomerModel {
  String? statusCode;
  String? status;
  String? message;
  CustomerResult? result;

  PostCustomerModel({
    this.statusCode,
    this.status,
    this.message,
    this.result,
  });

  factory PostCustomerModel.fromJson(Map<String, dynamic> json) => PostCustomerModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    result: json["result"] != null ? CustomerResult.fromJson(json["result"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "result": result?.toJson(),
  };
}

class CustomerResult {
  String? id;
  String? customerName;
  String? customerCode;
  String? email;
  String? phone;
  String? society;
  String? area;
  String? adharNo;
  String? panImage;
  String? documentImage;
  String? phone1;
  String? name1;
  String? phone2;
  String? name2;

  CustomerResult({
    this.id,
    this.customerName,
    this.customerCode,
    this.email,
    this.phone,
    this.society,
    this.area,
    this.adharNo,
    this.panImage,
    this.documentImage,
    this.phone1,
    this.name1,
    this.phone2,
    this.name2,
  });

  factory CustomerResult.fromJson(Map<String, dynamic> json) => CustomerResult(
    id: json["id"],
    customerName: json["customer_name"],
    customerCode: json["customer_code"],
    email: json["email"],
    phone: json["phone"],
    society: json["society"],
    area: json["area"],
    adharNo: json["adhar_no"],
    panImage: json["pan_image"],
    documentImage: json["document_image"],
    phone1: json["phone1"],
    name1: json["name1"],
    phone2: json["phone2"],
    name2: json["name2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_name": customerName,
    "customer_code": customerCode,
    "email": email,
    "phone": phone,
    "society": society,
    "area": area,
    "adhar_no": adharNo,
    "pan_image": panImage,
    "document_image": documentImage,
    "phone1": phone1,
    "name1": name1,
    "phone2": phone2,
    "name2": name2,
  };
}
