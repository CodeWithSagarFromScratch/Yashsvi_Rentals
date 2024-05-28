import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Model/ReceiptSave_Model.dart';
import 'package:yashvi_rentals/Services/http_services.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';
import 'package:yashvi_rentals/Widgets/custom_toast.dart';


class ReceiptController extends GetxController {
  ReciptSaveModel reciptSaveModel = ReciptSaveModel();
  final formKey = GlobalKey<FormState>();

  Future<void> addReceipt({
    required String orderNumber,
    required String socity,
    required String rentAmount,
    required String paidAmount,
    required String paidDt,
    required String remark,
  }) async {
    CustomLoader.openCustomLoader();

    Map<String, dynamic> payload = {
      "order_number": orderNumber,
      "socity": socity,
      "rent_amount": rentAmount,
      "paid_amount": paidAmount,
      "paid_dt": paidDt,
      "remark": remark,
    };

    log("Post create receipt payload ::: $payload");

    try {
      var response = await HttpServices.postHttpMethod(
        url: EndPointConstant.receiptSave,
        payload: payload,
      );

     // log("Post receipt response ::: $response");
      log("Post receipt response payload ::: $payload");

      // if (response["Status_code"] == "200") {
      reciptSaveModel = reciptSaveModelFromJson(response["body"]);

      if (reciptSaveModel.statusCode == "200") {
        CustomLoader.closeCustomLoader();
        customToast(message: "${reciptSaveModel.message}");

        // Navigate to the receipt list view or update UI accordingly
        // Get.to(ReceiptListView());

        update();
      } else {
        CustomLoader.closeCustomLoader();
        customToast(message: "${reciptSaveModel.message}");
      }
    }
    // else {
    //   CustomLoader.closeCustomLoader();
    //   customToast(message: "Failed to add receipt. Status Code: ${response["Status_code"]}");
    // }

    catch (error, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during posting receipt ::: $error");
      log("Error location during posting receipt ::: $st");
    }
  }
}

