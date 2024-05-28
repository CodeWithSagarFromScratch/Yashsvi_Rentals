import 'dart:convert';

PostMaterialItemModel postMaterialItemModelFromJson(String str) =>
    PostMaterialItemModel.fromJson(json.decode(str));

String postMaterialItemModelToJson(PostMaterialItemModel data) =>
    json.encode(data.toJson());

class PostMaterialItemModel {
  String? statusCode;
  String? message;
  MaterialOrderDetails? materialOrderDetails;

  PostMaterialItemModel({
    this.statusCode,
    this.message,
    this.materialOrderDetails,
  });

  factory PostMaterialItemModel.fromJson(Map<String, dynamic> json) =>
      PostMaterialItemModel(
        statusCode: json["Status_code"],
        message: json["message"],
        materialOrderDetails:
            MaterialOrderDetails.fromJson(json["Material_Order_Details"]),
      );

  Map<String, dynamic> toJson() => {
        "Status_code": statusCode,
        "message": message,
        "Material_Order_Details": materialOrderDetails?.toJson(),
      };
}

class MaterialOrderDetails {
  String? id;
  String? customerName;
  String? customerCode;
  String? materialNumber;
  DateTime? materialDt;
  String? orderItem;
  String? username;

  MaterialOrderDetails({
    this.id,
    this.customerName,
    this.customerCode,
    this.materialNumber,
    this.materialDt,
    this.orderItem,
    this.username,
  });

  factory MaterialOrderDetails.fromJson(Map<String, dynamic> json) =>
      MaterialOrderDetails(
        id: json["id"],
        customerName: json["customer_name"],
        customerCode: json["customer_code"],
        materialNumber: json["material_number"],
        materialDt: DateTime.parse(json["material_dt"]),
        orderItem: json["order_item"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "customer_code": customerCode,
        "material_number": materialNumber,
        "material_dt":
            "${materialDt?.year.toString().padLeft(4, '0')}-${materialDt?.month.toString().padLeft(2, '0')}-${materialDt?.day.toString().padLeft(2, '0')}",
        "order_item": orderItem,
        "username": username,
      };
}
