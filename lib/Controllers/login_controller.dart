import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Constant/storage_key_constant.dart';
import 'package:yashvi_rentals/Model/post_login_model.dart';
import 'package:yashvi_rentals/Services/http_services.dart';
import 'package:yashvi_rentals/Services/storage_services.dart';
import 'package:yashvi_rentals/View/Dashbord_View.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';
import 'package:yashvi_rentals/Widgets/custom_toast.dart';



class LoginController extends GetxController {
  PostLoginModel postLoginModel = PostLoginModel();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> postLogin() async {
    try {
      CustomLoader.openCustomLoader();

      Map<String, dynamic> payload = {
        "phone": phoneController.text,
        "password": passwordController.text,
      };

      log("Post login payload ::: $payload");

      var response = await HttpServices.postHttpMethod(
          url: EndPointConstant.login, payload: payload);

      postLoginModel = postLoginModelFromJson(response["body"]);

      if (postLoginModel.statusCode == "200" ||
          postLoginModel.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        log('Login successful. Navigating to BottomBarView...');
        await StorageServices.setData(
            dataType: StorageKeyConstant.boolType,
            prefKey: StorageKeyConstant.isAuthenticate,
            boolData: true);
        await StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.empName,
            stringData: "${postLoginModel.result?.empName}");
        await StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.loginId,
            stringData: "${postLoginModel.result?.loginId}");
        await StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.phone,
            stringData: "${postLoginModel.result?.phone}");
        // await StorageServices.setData(
        //     dataType: StorageKeyConstant.stringType,
        //     prefKey: StorageKeyConstant.email,
        //     stringData: "${postLoginModel.result?.emailAddress}");
        await StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userType,
            stringData: "${postLoginModel.result?.userType}");

        customToast(message: "${postLoginModel.message}");
      //   Get.offAll(() => MasterFormView());
         Get.offAll(() => DashboardViewSection());
        // Get.offAll(() => CatageryScreen());
      } else {
        CustomLoader.closeCustomLoader();
        customToast(message: "${postLoginModel.message}");
        // Get.offAll(() => MasterFormView());
         Get.offAll(() => DashboardViewSection());
        //  Get.offAll(() => CatageryScreen());
      }
    } catch (error) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during login ::: $error");
    }
  }
}
