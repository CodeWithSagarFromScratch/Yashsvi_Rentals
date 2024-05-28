import 'dart:developer';
import 'package:get/get.dart';


class SelectCityController extends GetxController {
  // GetCityListModel getCityListModel = GetCityListModel();

  @override
  void onInit() {
    super.onInit();
   // getCityList().whenComplete(() => update());
  }
  //
  // Future getCityList() async {
  //   try {
  //     CustomLoader.openCustomLoader();
  //
  //     var response =
  //         await HttpServices.getHttpMethod(url: EndPointConstant.citylist);
  //
  //     log("Get city list response ::: $response");
  //
  //     getCityListModel = getCityListModelFromJson(response["body"]);
  //
  //     if (getCityListModel.statusCode == "200" ||
  //         getCityListModel.statusCode == "201") {
  //       CustomLoader.closeCustomLoader();
  //     } else {
  //       CustomLoader.closeCustomLoader();
  //       log("Something went wrong during getting city list ::: ${getCityListModel.message}");
  //     }
  //   } catch (error) {
  //     CustomLoader.closeCustomLoader();
  //     log("Something went wrong during getting city list ::: $error");
  //   }
  // }
}
