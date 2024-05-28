import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Model/OrderList_Model.dart';
import 'package:yashvi_rentals/Services/http_services.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';


class MaterialOrderListcontroller extends GetxController {
  MaterialOrderListModel materialOrderListModel = MaterialOrderListModel();
  TextEditingController quantityController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    GetMaterialOrderList();
  }

  Future<void> GetMaterialOrderList() async {
    CustomLoader.openCustomLoader();

    try {
      var response = await HttpServices.getHttpMethod(
        url: EndPointConstant.materialorderlist,
      );

      materialOrderListModel = materialOrderListModelFromJson(response["body"]);

      if (materialOrderListModel.statusCode == "200") {
        CustomLoader.closeCustomLoader();
        update();
      } else {
        CustomLoader.closeCustomLoader();
      }
    } catch (error, st) {
      CustomLoader.closeCustomLoader();
      log("Error getting material order list: $error");
      log("Error location: $st");
    }
  }
}
