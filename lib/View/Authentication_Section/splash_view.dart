import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/image_path_constant.dart';
import 'package:yashvi_rentals/Controllers/splash_controller.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return Center(
              child: Image.asset(
                ImagePathConstant.Logo,
                height: Get.height * 0.200,
                width: Get.width * 0.800,
              ),
            );
          }),
    );
  }
}
