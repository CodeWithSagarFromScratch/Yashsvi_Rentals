import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/storage_key_constant.dart';
import 'package:yashvi_rentals/Services/storage_services.dart';
import 'package:yashvi_rentals/View/Authentication_Section/login_view.dart';



class SplashController extends GetxController {
  RxBool isAuthenticate = false.obs;

  @override
  void onInit() {
    super.onInit();
    navigateScreen();
  }

  navigateScreen() async {
    isAuthenticate.value = await StorageServices.getData(
            dataType: StorageKeyConstant.boolType,
            prefKey: StorageKeyConstant.isAuthenticate) ??
        false;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isAuthenticate.value) {
           Get.offAll(() => LoginView());
          // Get.offAll(() => BottomBarView());
        } else {
           Get.offAll(const LoginView());
        }
      },
    );
  }
}
