import 'dart:developer';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Constant/storage_key_constant.dart';
import 'package:yashvi_rentals/Model/profile_deailes_model.dart';
import 'package:yashvi_rentals/Services/http_services.dart';
import 'package:yashvi_rentals/Services/storage_services.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';



class ProfileController extends GetxController {
  GetProfileDetailmodel getProfileDetailmodel = GetProfileDetailmodel();

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      CustomLoader.openCustomLoader();

      String username = await StorageServices.getData(
          dataType: StorageKeyConstant.stringType,
          prefKey: StorageKeyConstant.empName);

      Map<String, String> payload = {"username": username};
      final response = await HttpServices.postHttpMethod(
        url: EndPointConstant.profile,
        payload: payload,
      );

      log("Get profile detail response ::: $response");

      // Parse the response body and update the model
      getProfileDetailmodel = getProfileDetailmodelFromJson(response["body"]);

      if (getProfileDetailmodel.statusCode == "200" ||
          getProfileDetailmodel.statusCode == "201") {
        CustomLoader.closeCustomLoader();
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during profile data fetching ::: ${getProfileDetailmodel.message}");
      }
    } catch (error) {
      CustomLoader.closeCustomLoader();
      log("Error fetching profile data: $error");
    }
    update();
  }
}
