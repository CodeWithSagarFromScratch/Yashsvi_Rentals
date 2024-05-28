import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Model/GetUserList_Model.dart';
import 'package:yashvi_rentals/Services/http_services.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';


class UseListController extends GetxController {
  GetUserListModel getUserListModel = GetUserListModel();
  TextEditingController quantityController = TextEditingController();
  TextEditingController RentController = TextEditingController();
  TextEditingController DepositeController = TextEditingController();
  TextEditingController RemarkController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    GetUserList();
  }

  Future<void> GetUserList() async {
    CustomLoader.openCustomLoader();

    var response = await HttpServices.getHttpMethod(
        url: EndPointConstant.customerlist);

    log("Get User list response ::: $response");

    getUserListModel = getUserListModelFromJson(response["body"]);

    try {
      if (getUserListModel.statusCode == "200") {
        CustomLoader.closeCustomLoader();
        update();
      } else {
        CustomLoader.closeCustomLoader();
        // Handle error case
      }
    } catch (error, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting Customer list ::: $error");
      log("Error location during getting Customer list ::: $st");
    }
  }

  // Method to filter names based on search query
  void filterNames(String query) {
    if (query.isEmpty) {
      // If the query is empty, reset the filtered list to the original list
      getUserListModel.filteredNames = List.from(getUserListModel.customerList!);
    } else {
      // Filter the names based on the query
      getUserListModel.filteredNames = getUserListModel.customerList
          ?.where((customer) =>
          customer.socity!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    // Update the UI after filtering
    update();
  }
}
