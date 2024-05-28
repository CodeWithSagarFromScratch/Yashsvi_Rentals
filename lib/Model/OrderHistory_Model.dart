import 'dart:convert';

// Function to convert JSON string to OrderHistoryModel
OrderHistoryModel orderHistoryModelFromJson(String str) =>
    OrderHistoryModel.fromJson(json.decode(str));

// Function to convert OrderHistoryModel to JSON string
String orderHistoryModelToJson(OrderHistoryModel data) =>
    json.encode(data.toJson());

class OrderHistoryModel {
  String? statusCode;
  String? status;
  String? message;
  List<OrderReceipt>? orderReceiptList;

  OrderHistoryModel({
    this.statusCode,
    this.status,
    this.message,
    this.orderReceiptList,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryModel(
        statusCode: json["status_code"]?.toString(),
        status: json["status"],
        message: json["message"],
        orderReceiptList: json["order_receipt_list"] == null
            ? null
            : List<OrderReceipt>.from(
            json["order_receipt_list"].map((x) => OrderReceipt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "order_receipt_list": orderReceiptList == null
        ? null
        : List<dynamic>.from(orderReceiptList!.map((x) => x.toJson())),
  };
}

class OrderReceipt {
  String? id;
  String? orderNumber;
  String? socity;
  String? rentAmount;
  String? paidAmount;
  String? paidDt;
  String? remark;
  String? tdate;

  OrderReceipt({
    this.id,
    this.orderNumber,
    this.socity,
    this.rentAmount,
    this.paidAmount,
    this.paidDt,
    this.remark,
    this.tdate,
  });

  factory OrderReceipt.fromJson(Map<String, dynamic> json) => OrderReceipt(
    id: json["id"]?.toString(),
    orderNumber: json["order_number"]?.toString(),
    socity: json["socity"],
    rentAmount: json["rent_amount"]?.toString(),
    paidAmount: json["paid_amount"]?.toString(),
    paidDt: json["paid_dt"]?.toString(),
    remark: json["remark"],
    tdate: json["tdate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_number": orderNumber,
    "socity": socity,
    "rent_amount": rentAmount,
    "paid_amount": paidAmount,
    "paid_dt": paidDt,
    "remark": remark,
    "tdate": tdate,
  };
}
