import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Model/OrderHistory_Model.dart';
import 'package:yashvi_rentals/Services/http_services.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';


class OrderHistoryController extends GetxController {
  OrderHistoryModel orderHistoryModel = OrderHistoryModel();
  TextEditingController filterController = TextEditingController();

  final String orderNumber;

  OrderHistoryController({required this.orderNumber});

  @override
  void onInit() {
    super.onInit();
    getOrderHistory();
  }

  Future<void> getOrderHistory() async {
    CustomLoader.openCustomLoader();

    try {
      Map<String, dynamic> payload = {
        "order_number": orderNumber,
      };

      log("Post login payload ::: $payload");

      var response = await HttpServices.postHttpMethod(
          url: EndPointConstant.orderreceipthistory, payload: payload
      );

      log("Response received: ${response["body"]}");

      orderHistoryModel = orderHistoryModelFromJson(response["body"]);

      if (orderHistoryModel.statusCode == "200") {
        CustomLoader.closeCustomLoader();
        update();
      } else {
        CustomLoader.closeCustomLoader();
      }
    } catch (error, st) {
      CustomLoader.closeCustomLoader();
      log("Error getting order history: $error");
      log("Error location: $st");
    }
  }
}
