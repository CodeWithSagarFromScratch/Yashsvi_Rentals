import 'dart:convert';

GetMaterialRequiredModel getMaterialRequiredModelFromJson(String str) =>
    GetMaterialRequiredModel.fromJson(json.decode(str));

String getMaterialRequiredModelToJson(GetMaterialRequiredModel data) =>
    json.encode(data.toJson());

class GetMaterialRequiredModel {
  String? statusCode;
  String? message;
  List<MaterialRequirementItemList>? itemList;

  GetMaterialRequiredModel({
    this.statusCode,
    this.message,
    this.itemList,
  });

  factory GetMaterialRequiredModel.fromJson(Map<String, dynamic> json) {
    return GetMaterialRequiredModel(
      statusCode: json["status_code"],
      message: json["message"],
      itemList: json["item_list"] != null
          ? List<MaterialRequirementItemList>.from(
          json["item_list"].map((x) => MaterialRequirementItemList.fromJson(x)))
          : null, // Check for null before mapping
    );
  }

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "item_list": itemList != null ? List<dynamic>.from(itemList!.map((x) => x.toJson())) : null,
  };
}


class MaterialRequirementItemList {
  String? id;
  String? category;
  String? code;
  String? itemname;
  Unit? unit;

  MaterialRequirementItemList({
    this.id,
    this.category,
    this.code,
    this.itemname,
    this.unit,
  });

  factory MaterialRequirementItemList.fromJson(Map<String, dynamic> json) =>
      MaterialRequirementItemList(
        id: json["id"],
        category: json["category"],
        code: json["code"],
        itemname: json["itemname"],
        unit: unitValues.map[json["unit"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "code": code,
        "itemname": itemname,
        "unit": unitValues.reverse[unit],
      };
}

enum Unit { EMPTY, MTR, NOS, R_MTR }

final unitValues = EnumValues(
    {"": Unit.EMPTY, "MTR": Unit.MTR, "NOS": Unit.NOS, "R.MTR.": Unit.R_MTR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
