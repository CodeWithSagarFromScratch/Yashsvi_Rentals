import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/layout_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/AddCustomer_Controller.dart';
import 'package:yashvi_rentals/Services/form_validation_services.dart';
import 'package:yashvi_rentals/Widgets/custom_button.dart';
import 'package:yashvi_rentals/Widgets/custom_textfield.dart';
import 'package:yashvi_rentals/Widgets/custom_toast.dart';


class AddCustomerFormView extends StatelessWidget {
  const AddCustomerFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<PostAddCustomerController>(
          init: PostAddCustomerController(),
          builder: (controller) {
            return Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: Get.height * 0.350,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      //   color: ColorConstant.redAccent,
                      color: ColorConstant.brown,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24))),
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.050),
                    child: Text(
                      "Add User",
                      style:
                          TextStyleConstant.bold30(color: ColorConstant.white),
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
                    child: SingleChildScrollView(
                      child: Container(
                        padding: screenPadding,
                        // height: Get.height,
                        height: 1500,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: ColorConstant.lightGrey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(28)),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Align(
                              //   alignment: Alignment.center,
                              //   child: Image.asset(
                              //     ImagePathConstant.logo1,
                              //     height: Get.height * 0.080,
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.040,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Enter Phone",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.phoneController,
                                hintText: "Enter Mobile No",
                                textInputType: TextInputType.phone,
                                prefixIcon: const Icon(Icons.phone),
                                validator:
                                    FormValidationServices.validatePhone(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.020,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Name",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.nameController,
                                hintText: " Enter Name",
                                textInputType: TextInputType.name,
                                prefixIcon: const Icon(Icons.person),
                                validator: FormValidationServices.validateField(
                                    fieldName: "Name"),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       top: Get.height * 0.020,
                              //       bottom: Get.height * 0.006),
                              //   child: Text(
                              //     "Enter Email",
                              //     style: TextStyleConstant.semiBold16(),
                              //   ),
                              // ),
                              // CustomTextField(
                              //   controller: controller.emailController,
                              //   hintText: "Email",
                              //   textInputType: TextInputType.emailAddress,
                              //   prefixIcon: const Icon(Icons.email),
                              //   // validator:
                              //   //     FormValidationServices.validateEmail(),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.020,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Socity",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.socitynameController,
                                hintText: "Enter Socity Name",
                                textInputType: TextInputType.text,
                                prefixIcon: const Icon(Icons.email),
                                // validator: FormValidationServices.validateField(
                                //     fieldName: "SocirtName"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.020,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Area",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.areaController,
                                hintText: "Enter Area",
                                textInputType: TextInputType.text,
                                prefixIcon: const Icon(Icons.more),
                                // validator: FormValidationServices.validateField(
                                //     fieldName: "Type"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.020,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Adhar No",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.adharnoController,
                                hintText: " Enter Adhar No",
                                textInputType: TextInputType.text,
                                prefixIcon: const Icon(Icons.real_estate_agent),
                                // validator: FormValidationServices.validateField(
                                //     fieldName: "Type"),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Enter Your Products Image",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: Get.height * 0.030),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    imageBox(
                                      onTap: () {
                                        selectImageSourceDialog(
                                            controller: controller, imageNo: 1);
                                      },
                                      image: (controller.selectedImage1 != null)
                                          ? File(
                                              controller.selectedImage1!.path)
                                          : File(""),
                                    ),
                                    imageBox(
                                      onTap: () {
                                        selectImageSourceDialog(
                                            controller: controller, imageNo: 2);
                                      },
                                      image: (controller.selectedImage2 != null)
                                          ? File(
                                              controller.selectedImage2!.path)
                                          : File(""),
                                    ),
                                    // imageBox(
                                    //   onTap: () {
                                    //     selectImageSourceDialog(controller: controller, imageNo: 3);
                                    //   },
                                    //   image: (controller.selectedImage3 != null)
                                    //       ? File(controller.selectedImage3!.path)
                                    //       : File(""),
                                    // ),
                                    // imageBox(
                                    //   onTap: () {
                                    //     selectImageSourceDialog(controller: controller, imageNo: 4);
                                    //   },
                                    //   image: (controller.selectedImage4 != null)
                                    //       ? File(controller.selectedImage4!.path)
                                    //       : File(""),
                                    // ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.040,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Enter Phone",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.phone1Controller,
                                hintText: "Enter Mobile No",
                                textInputType: TextInputType.phone,
                                prefixIcon: const Icon(Icons.phone),
                                // validator:
                                //     FormValidationServices.validatePhone(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.020,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Name",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.name1Controller,
                                hintText: " Enter Name",
                                textInputType: TextInputType.name,
                                prefixIcon: const Icon(Icons.person),
                                // validator: FormValidationServices.validateField(
                                //     fieldName: "Name"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.040,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Enter Phone",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.phone2Controller,
                                hintText: "Enter Mobile No",
                                textInputType: TextInputType.phone,
                                prefixIcon: const Icon(Icons.phone),
                                // validator:
                                //     FormValidationServices.validatePhone(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.020,
                                    bottom: Get.height * 0.006),
                                child: Text(
                                  "Name",
                                  style: TextStyleConstant.semiBold16(),
                                ),
                              ),
                              CustomTextField(
                                controller: controller.name2Controller,
                                hintText: " Enter Name",
                                textInputType: TextInputType.name,
                                prefixIcon: const Icon(Icons.person),
                                // validator: FormValidationServices.validateField(
                                //     fieldName: "Name"),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  title: "Submit",
                                  onTap: () {
                                    // if (controller.formKey.currentState!
                                    //     .validate()) {
                                    //   controller.PostAddCustomerController();
                                    // }
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.postCustomer();
                                    } else {
                                      customToast(message: "Data Not Sumbited");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  selectImageSourceDialog(
      {required PostAddCustomerController controller, required int imageNo}) {
    return Get.dialog(AlertDialog(
      title: const Text("Select Image Source Type"),
      content: Column(
        children: [
          Card(
              child: ListTile(
            onTap: () {
              Get.back();
              controller
                  .pickImage(imageNo: imageNo, imageSource: ImageSource.camera)
                  .whenComplete(() => controller.update());
            },
            title: const Text("Select From Camera"),
          )),
          Card(
              child: ListTile(
            onTap: () {
              Get.back();
              controller
                  .pickImage(imageNo: imageNo, imageSource: ImageSource.gallery)
                  .whenComplete(() => controller.update());
            },
            title: const Text("Select From Gallery"),
          )),
        ],
      ),
    ));
  }

  Widget imageBox({required Function() onTap, required File image}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.080,
        width: Get.width * 0.170,
        decoration: BoxDecoration(
            color: ColorConstant.lightGrey,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 2, color: ColorConstant.darkGrey),
            image: DecorationImage(image: FileImage(image), fit: BoxFit.fill)),
      ),
    );
  }
}
