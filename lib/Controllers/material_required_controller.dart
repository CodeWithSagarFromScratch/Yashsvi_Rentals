import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Constant/storage_key_constant.dart';
import 'package:yashvi_rentals/Model/GetUserList_Model.dart';
import 'package:yashvi_rentals/Model/Order_Place_Model.dart';
import 'package:yashvi_rentals/Model/get_material_required_model.dart';
import 'package:yashvi_rentals/Services/http_services.dart';
import 'package:yashvi_rentals/Services/storage_services.dart';
import 'package:yashvi_rentals/View/OrderList_view.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';
import 'package:yashvi_rentals/Widgets/custom_toast.dart';
import 'OrderList_Controller.dart';


class MaterialRequiredController extends GetxController {
  GetMaterialRequiredModel getMaterialRequiredModel =
      GetMaterialRequiredModel();
  OrderPlaceModel orderPlaceModel = OrderPlaceModel();
  GetUserListModel getUserListModel = GetUserListModel();
  TextEditingController quantityController = TextEditingController();

  RxList<Map> createdMaterialItemList = <Map>[].obs;
  RxString selectMaterial = "Select Material".obs;
  RxString selectUnit = "".obs;
  RxString selectId = "Id".obs;
  RxString selectCategory = "Category".obs;
  RxString selectCode = "Code".obs;
  RxString siteName = "".obs;
  RxString siteCode = "".obs;
  RxString customercode = "".obs;
  RxString userName = "".obs;
  TextEditingController RentController = TextEditingController();
  TextEditingController DepositeController = TextEditingController();
  TextEditingController RemarkController = TextEditingController();
  TextEditingController nameController = TextEditingController();

    RxString selectedCategory = "Select Name".obs;
  RxString selectedCategoryId = "".obs;
  final formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    initialFunctioun();

  }
  RxString loginId = "".obs;
  RxString empName = "".obs;
  RxString customerName = "".obs;

  initialFunctioun() async {
    siteName.value = await StorageServices.getData(
            prefKey: StorageKeyConstant.siteName,
            dataType: StorageKeyConstant.stringType) ??
       "Site name";
    siteCode.value = await StorageServices.getData(
            prefKey: StorageKeyConstant.siteCode,
            dataType: StorageKeyConstant.stringType) ??
      "Site code";
    userName.value = await StorageServices.getData(
        prefKey: StorageKeyConstant.loginId,
        dataType: StorageKeyConstant.stringType);

    loginId.value = await StorageServices.getData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.loginId);

    empName.value = await StorageServices.getData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.empName);

    await getMaterialRequiredItemList();
  }

  Future getMaterialRequiredItemList() async {
    CustomLoader.openCustomLoader();

    var response = await HttpServices.getHttpMethod(
        url: EndPointConstant.materialRequirementItemList);

    log("Get material required item list response ::: $response");

    getMaterialRequiredModel =
        getMaterialRequiredModelFromJson(response["body"]);

    try {
      if (getMaterialRequiredModel.statusCode == "200" ||
          getMaterialRequiredModel.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        update();
      } else {
        CustomLoader.closeCustomLoader();
      }
    } catch (error, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting material required items list ::: $error");
      log("Error location during getting material required items list ::: $st");
    }
  }

  Future<void> OrderPlaceItmeList(String socityName) async {
    CustomLoader.openCustomLoader();

    Map<String, dynamic> payload = {
      "customer_code": "BD3",
      "customer_name": socityName,
      "login_id": loginId.value,
      "rent_amount": RentController.text,
      "remark": RemarkController.text,
      "deposite_amount": DepositeController.text,
      "order_item": jsonEncode(createdMaterialItemList), // Directly encode list
    };

    log("Post create material item list payload ::: $payload");

    try {
      var response = await HttpServices.postHttpMethod(
        url: EndPointConstant.materialOrder,
        payload: payload,
      );

      log("Post material Material Order Details list response ::: $response");


        if (orderPlaceModel.statusCode == "200" || orderPlaceModel.statusCode == "201") {
          CustomLoader.closeCustomLoader();
          customToast(message: "Order Add Successfully!");
          Get.to(OrderListView(

          ));

          Get.find<MaterialOrderListcontroller>().GetMaterialOrderList();
          // Clear the createdMaterialItemList after successful order placement
          createdMaterialItemList.clear();

          // Notify MaterialOrderListcontroller to fetch updated list
          // Get.find<MaterialOrderListcontroller>().GetMaterialOrderList();



          update();
        } else {
          CustomLoader.closeCustomLoader();
          Get.to(OrderListView());
         // customToast(message: "${orderPlaceModel.message}");
         // customToast(message: "Failed to add Order. Please try again.");
        }
      }

     catch (error, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during posting material required items list ::: $error");
      log("Error location during posting material required items list::: $st");
    }
  }


}
