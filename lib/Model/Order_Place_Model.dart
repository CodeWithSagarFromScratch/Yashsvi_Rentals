import 'dart:convert';

OrderPlaceModel orderPlaceModelFromJson(String str) =>
    OrderPlaceModel.fromJson(json.decode(str));

String orderPlaceModelToJson(OrderPlaceModel data) =>
    json.encode(data.toJson());

class OrderPlaceModel {
  String? statusCode;
  String? status;
  String? message;
  MaterialOrderDetails? materialOrderDetails;

  OrderPlaceModel({
    this.statusCode,
    this.status,
    this.message,
    this.materialOrderDetails,
  });

  factory OrderPlaceModel.fromJson(Map<String, dynamic> json) => OrderPlaceModel(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    materialOrderDetails: MaterialOrderDetails.fromJson(json["Material_Order_Details"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "Material_Order_Details": materialOrderDetails!.toJson(),
  };
}

class MaterialOrderDetails {
  String? id;
  String? customerName;
  String? customerCode;
  String? orderNumber;
  String? orderDt;
  List<OrderItem>? orderItem;
  String? rentAmount;
  String? depositeAmount;
  String? username;

  MaterialOrderDetails({
    this.id,
    this.customerName,
    this.customerCode,
    this.orderNumber,
    this.orderDt,
    this.orderItem,
    this.rentAmount,
    this.depositeAmount,
    this.username,
  });

  factory MaterialOrderDetails.fromJson(Map<String, dynamic> json) => MaterialOrderDetails(
    id: json["id"],
    customerName: json["customer_name"],
    customerCode: json["customer_code"],
    orderNumber: json["order_number"],
    orderDt: json["order_dt"],
    orderItem: List<OrderItem>.from(json["order_item"].map((x) => OrderItem.fromJson(x))),
    rentAmount: json["rent_amount"],
    depositeAmount: json["deposite_amount"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_name": customerName,
    "customer_code": customerCode,
    "order_number": orderNumber,
    "order_dt": orderDt,
    "order_item": List<dynamic>.from(orderItem!.map((x) => x.toJson())),
    "rent_amount": rentAmount,
    "deposite_amount": depositeAmount,
    "username": username,
  };
}

class OrderItem {
  String? cartId;
  String? id;
  String? itemname;
  String? code;
  String? quantity;
  Unit? unit;

  OrderItem({
    this.cartId,
    this.id,
    this.itemname,
    this.code,
    this.quantity,
    this.unit,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    cartId: json["cartId"],
    id: json["id"],
    itemname: json["itemname"],
    code: json["code"],
    quantity: json["quantity"],
    unit: unitValues.map[json["unit"]],
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId,
    "id": id,
    "itemname": itemname,
    "code": code,
    "quantity": quantity,
    "unit": unitValues.reverse[unit],
  };
}

enum Unit { EMPTY, MTR, NOS, R_MTR }

final unitValues = EnumValues({"": Unit.EMPTY, "MTR": Unit.MTR, "NOS": Unit.NOS, "R_MTR": Unit.R_MTR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
