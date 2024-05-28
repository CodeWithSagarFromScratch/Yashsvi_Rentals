import 'dart:convert';

MaterialOrderListModel materialOrderListModelFromJson(String str) =>
    MaterialOrderListModel.fromJson(json.decode(str));

String materialOrderListModelToJson(MaterialOrderListModel data) =>
    json.encode(data.toJson());

class MaterialOrderListModel {
  String? statusCode;
  String? status;
  String? message;
  List<Order>? orderList;

  MaterialOrderListModel({
    this.statusCode,
    this.status,
    this.message,
    this.orderList,
  });

  factory MaterialOrderListModel.fromJson(Map<String, dynamic> json) =>
      MaterialOrderListModel(
        statusCode: json["status_code"],
        status: json["status"],
        message: json["message"],
        orderList:
        List<Order>.from(json["order_list"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "order_list": List<dynamic>.from(orderList!.map((x) => x.toJson())),
  };
}

class Order {
  String? id;
  String? orderNumber;
  String? orderDt;
  String? customerName;
  String? customerCode;
  String? rentAmount;
  String? depositeAmount;
  String? socityname;
  String? username;

  Order({
    this.id,
    this.orderNumber,
    this.orderDt,
    this.customerName,
    this.customerCode,
    this.rentAmount,
    this.depositeAmount,
    this.socityname,
    this.username,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    orderNumber: json["order_number"],
    orderDt: json["order_dt"],
    customerName: json["customer_name"],
    customerCode: json["customer_code"],
    rentAmount: json["rent_amount"],
    depositeAmount: json["deposite_amount"],
    socityname: json["socity_name"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_number": orderNumber,
    "order_dt": orderDt,
    "customer_name": customerName,
    "customer_code": customerCode,
    "rent_amount": rentAmount,
    "deposite_amount": depositeAmount,
    "socity_name": socityname,
    "username": username,
  };
}
