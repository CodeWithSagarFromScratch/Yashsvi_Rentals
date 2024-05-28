import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/layout_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/material_required_controller.dart';
import 'package:yashvi_rentals/Services/form_validation_services.dart';
import 'package:yashvi_rentals/Widgets/custom_button.dart';
import 'package:yashvi_rentals/Widgets/custom_textfield.dart';
import 'package:yashvi_rentals/Widgets/custom_toast.dart';

class OrderPlaceView extends StatefulWidget {
  final String socityName;

  const OrderPlaceView({super.key, required this.socityName});

  @override
  State<OrderPlaceView> createState() => _OrderPlaceViewState();
}

class _OrderPlaceViewState extends State<OrderPlaceView> {
  TextEditingController socityNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    socityNameController.text = widget.socityName;
    log("message:${socityNameController.text} ");
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<MaterialRequiredController>(
        init: MaterialRequiredController(),
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
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.050),
                  child: Text(
                    "Order Place",
                    style: TextStyleConstant.bold30(color: ColorConstant.white),
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: screenPadding,
                    height: 1200,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: ColorConstant.lightGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.100,
                        horizontal: Get.width * 0.038,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: Get.height * 0.020,
                                bottom: Get.height * 0.006,
                              ),
                              child: Text(
                                "Society Name",
                                style: TextStyleConstant.semiBold16(),
                              ),
                            ),
                            CustomTextField(
                              controller: socityNameController,
                              hintText: "Enter Society Name",
                              textInputType: TextInputType.name,
                              prefixIcon: Icon(Icons.home),
                              validator: FormValidationServices.validateField(
                                fieldName: "Society Name",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Get.height * 0.040,
                                bottom: Get.height * 0.006,
                              ),
                              child: Text(
                                "Rent",
                                style: TextStyleConstant.semiBold16(),
                              ),
                            ),
                            CustomTextField(
                              controller: controller.RentController,
                              hintText: "Enter Rent Amount",
                              textInputType: TextInputType.text,
                              prefixIcon: Icon(Icons.money),
                              validator: FormValidationServices.validatePhone(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Get.height * 0.040,
                                bottom: Get.height * 0.006,
                              ),
                              child: Text(
                                "Deposit",
                                style: TextStyleConstant.semiBold16(),
                              ),
                            ),
                            CustomTextField(
                              controller: controller.DepositeController,
                              hintText: "Enter Deposit Amount",
                              textInputType: TextInputType.text,
                              prefixIcon: Icon(Icons.money),
                              validator: FormValidationServices.validatePhone(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Get.height * 0.040,
                                bottom: Get.height * 0.006,
                              ),
                              child: Text(
                                "Remark",
                                style: TextStyleConstant.semiBold16(),
                              ),
                            ),
                            CustomTextField(
                              controller: controller.RemarkController,
                              hintText: "Enter Remark",
                              textInputType: TextInputType.text,
                              prefixIcon: Icon(Icons.remember_me),
                              validator: FormValidationServices.validatePhone(),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Get.dialog(
                                    Material(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: ColorConstant.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () => Get.back(),
                                                  icon: Icon(Icons.arrow_back),
                                                ),
                                                Text(
                                                  "Select Material Item",
                                                  style: TextStyleConstant
                                                      .semiBold30(),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemCount: controller
                                                        .getMaterialRequiredModel
                                                        .itemList
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  return Card(
                                                    child: ListTile(
                                                      onTap: () {
                                                        controller
                                                                .selectMaterial
                                                                .value =
                                                            "${controller.getMaterialRequiredModel.itemList?[index].itemname}";
                                                        controller.selectUnit
                                                                .value =
                                                            "${controller.getMaterialRequiredModel.itemList?[index].unit}";
                                                        controller
                                                                .selectCategory
                                                                .value =
                                                            "${controller.getMaterialRequiredModel.itemList?[index].category}";
                                                        controller.selectCode
                                                                .value =
                                                            "${controller.getMaterialRequiredModel.itemList?[index].code}";
                                                        controller.selectId
                                                                .value =
                                                            "${controller.getMaterialRequiredModel.itemList?[index].id}";
                                                        Get.back();
                                                        controller.update();
                                                      },
                                                      title: Text(
                                                        "${controller.getMaterialRequiredModel.itemList?[index].itemname}",
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                title: Text(controller.selectMaterial.value),
                                trailing: Icon(Icons.arrow_drop_down),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.020,
                              ),
                              child: ListTile(
                                title: Text(
                                  controller.selectUnit.value,
                                  style:
                                      TextStyle(color: ColorConstant.lightGrey),
                                ),
                              ),
                            ),
                            Form(
                              key: controller.formKey,
                              child: CustomTextField(
                                controller: controller.quantityController,
                                hintText: "Enter Quantity",
                                prefixIcon: Icon(
                                    Icons.production_quantity_limits_rounded),
                                textInputType: TextInputType.number,
                                validator: FormValidationServices.validateField(
                                  fieldName: "Quantity",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: Get.height * 0.020),
                              child: CustomButton(
                                title: "Add to List",
                                width: Get.width * 0.500,
                                onTap: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.createdMaterialItemList.add({
                                      "cartId": controller.selectCode.value,
                                      "id": controller.selectId.value,
                                      "itemname":
                                          controller.selectMaterial.value,
                                      "code": controller.selectCode.value,
                                      "quantity":
                                          controller.quantityController.text,
                                      "unit": controller.selectUnit.value,
                                    });
                                    controller.update();
                                  }
                                },
                              ),
                            ),
                            Obx(() {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      controller.createdMaterialItemList.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                "Item Name: ${controller.createdMaterialItemList[index]["itemname"]}",
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2.0),
                                              child: Text(
                                                "Quantity: ${controller.createdMaterialItemList[index]["quantity"]}",
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            controller.createdMaterialItemList
                                                .removeAt(index);
                                            controller.update();
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                            CustomButton(
                              title: "Submit",
                              onTap: () {
                                if (controller
                                    .createdMaterialItemList.isNotEmpty) {
                                  controller.OrderPlaceItmeList(
                                      socityNameController.text);
                                } else {
                                  customToast(
                                      message:
                                          "Please Add At Least 1 Material List");
                                }
                              },
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
        },
      ),
    );
  }
}
