import 'dart:convert';


ReciptSaveModel reciptSaveModelFromJson(String str) =>
    ReciptSaveModel.fromJson(json.decode(str));


String reciptSaveModelToJson(ReciptSaveModel data) =>
    json.encode(data.toJson());

class ReciptSaveModel {
  String? statusCode;
  String? status;
  String? message;
  ReciptDetails? reciptDetails;

  ReciptSaveModel({
    this.statusCode,
    this.status,
    this.message,
    this.reciptDetails,
  });

  factory ReciptSaveModel.fromJson(Map<String, dynamic> json) => ReciptSaveModel(
    statusCode: json["Status_code"]?.toString(),
    status: json["status"],
    message: json["message"],
    reciptDetails: json["Recipt_Details"] == null
        ? null
        : ReciptDetails.fromJson(json["Recipt_Details"]),
  );

  Map<String, dynamic> toJson() => {
    "Status_code": statusCode,
    "status": status,
    "message": message,
    "Recipt_Details": reciptDetails?.toJson(),
  };
}

class ReciptDetails {
  String? id;
  String? orderNumber;
  String? socity;
  String? rentAmount;
  String? paidAmount;
  String? paidDt;
  String? remark;
  String? tdate;

  ReciptDetails({
    this.id,
    this.orderNumber,
    this.socity,
    this.rentAmount,
    this.paidAmount,
    this.paidDt,
    this.remark,
    this.tdate,
  });

  factory ReciptDetails.fromJson(Map<String, dynamic> json) => ReciptDetails(
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
