import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/image_path_constant.dart';
import 'package:yashvi_rentals/Constant/layout_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/login_controller.dart';
import 'package:yashvi_rentals/Services/form_validation_services.dart';
import 'package:yashvi_rentals/Widgets/custom_button.dart';
import 'package:yashvi_rentals/Widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: Get.height * 0.350,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: ColorConstant.brown,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24))),
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.050),
                  child: Text(
                    "Welcome Back",
                    style: TextStyleConstant.bold30(color: ColorConstant.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.120,
                      bottom: Get.height * 0.060,
                      left: screenWidthPadding,
                      right: screenWidthPadding),
                  child: Container(
                    padding: screenPadding,
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: ColorConstant.lightGrey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(28)),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImagePathConstant.Logo,
                              height: Get.height * 0.080,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Get.height * 0.060,
                                bottom: Get.height * 0.006),
                            child: Text(
                              "Enter Phone",
                              style: TextStyleConstant.semiBold16(),
                            ),
                          ),
                          CustomTextField(
                            controller: controller.phoneController,
                            hintText: "Phone",
                            textInputType: TextInputType.phone,
                            prefixIcon: const Icon(Icons.phone),
                            validator: FormValidationServices.validatePhone(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Get.height * 0.020,
                                bottom: Get.height * 0.006),
                            child: Text(
                              "Enter Password",
                              style: TextStyleConstant.semiBold16(),
                            ),
                          ),
                          CustomTextField(
                            controller: controller.passwordController,
                            hintText: "Password",
                            textInputType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.lock),
                            validator: FormValidationServices.validateField(
                                fieldName: "Password"),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: Get.height * 0.070),
                          //   child: Align(
                          //     alignment: Alignment.center,
                          //     child: Text("Forgot Password?",
                          //         style: TextStyleConstant.semiBold18(
                          //             color: ColorConstant.redAccent)),
                          //   ),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text("Don't have an account  ",
                          //         style: TextStyleConstant.medium16()),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Get.to(() => const SignupView());
                          //       },
                          //       child: Text("Sign Up",
                          //           style: TextStyleConstant.semiBold18(
                          //               color: ColorConstant.redAccent)),
                          //     ),
                          //   ],
                          // ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                                title: "Login",
                                onTap: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.postLogin();
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
