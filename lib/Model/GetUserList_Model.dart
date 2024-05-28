import 'dart:convert';

GetUserListModel getUserListModelFromJson(String str) =>
    GetUserListModel.fromJson(json.decode(str));

String getUserListModelToJson(GetUserListModel data) =>
    json.encode(data.toJson());

class GetUserListModel {
  String? statusCode;
  String? message;
  List<Customer>? customerList;
  List<Customer>? filteredNames; // Define filteredNames property

  GetUserListModel({
    this.statusCode,
    this.message,
    this.customerList,
    this.filteredNames, // Add filteredNames to the constructor
  });

  factory GetUserListModel.fromJson(Map<String, dynamic> json) =>
      GetUserListModel(
        statusCode: json["status_code"],
        message: json["message"],
        customerList: List<Customer>.from(
            json["customer_list"].map((x) => Customer.fromJson(x))),
        filteredNames: List<Customer>.from(
            json["customer_list"].map((x) => Customer.fromJson(x))), // Initialize filteredNames with the original list
      );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "customer_list": List<dynamic>.from(customerList!.map((x) => x.toJson())),
  };
}

class Customer {
  String? id;
  String? customerName;
  String? customerCode;
  String? email;
  String? phone;
  String? socity;
  String? area;
  String? adharNo;
  String? panImage;
  String? documentImg;
  String? phone1;
  String? name1;
  String? phone2;
  String? name2;

  Customer({
    this.id,
    this.customerName,
    this.customerCode,
    this.email,
    this.phone,
    this.socity,
    this.area,
    this.adharNo,
    this.panImage,
    this.documentImg,
    this.phone1,
    this.name1,
    this.phone2,
    this.name2,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    customerName: json["customer_name"],
    customerCode: json["customer_code"],
    email: json["email"],
    phone: json["phone"],
    socity: json["socity"],
    area: json["area"],
    adharNo: json["adhar_no"],
    panImage: json["pan_image"],
    documentImg: json["document_img"],
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
    "socity": socity,
    "area": area,
    "adhar_no": adharNo,
    "pan_image": panImage,
    "document_img": documentImg,
    "phone1": phone1,
    "name1": name1,
    "phone2": phone2,
    "name2": name2,
  };
}
