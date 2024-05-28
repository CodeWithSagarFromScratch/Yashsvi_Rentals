import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/layout_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/ReceiptSave_Controller.dart';
import 'package:yashvi_rentals/Services/form_validation_services.dart';
import 'package:yashvi_rentals/Widgets/custom_button.dart';
import 'package:yashvi_rentals/Widgets/custom_textfield.dart';
import 'package:yashvi_rentals/Widgets/custom_toast.dart';

class ReceiptSaveView extends StatefulWidget {
  final String username;
  final String rent;
  final String date;
  final String orderNumber;

  const ReceiptSaveView({
    required this.username,
    required this.rent,
    required this.date,
    required this.orderNumber,
    Key? key,
  }) : super(key: key);

  @override
  _ReceiptSaveViewState createState() => _ReceiptSaveViewState();
}

class _ReceiptSaveViewState extends State<ReceiptSaveView> {
  late TextEditingController dateController;
  late TextEditingController nameController;
  late TextEditingController rentController;
  late TextEditingController remarkController;
  late TextEditingController orderNumberController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(text: widget.date);
    nameController = TextEditingController(text: widget.username);
    rentController = TextEditingController(text: widget.rent);
    remarkController = TextEditingController();
    orderNumberController = TextEditingController(text: widget.orderNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ReceiptController>(
        init: ReceiptController(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: Get.height * 0.350,
                width: Get.width,
                decoration: BoxDecoration(
                  color: ColorConstant.brown,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.050),
                  child: Text(
                    " Invoice Receipt",
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
                    right: screenWidthPadding,
                  ),
                  child: Container(
                    padding: screenPadding,
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: ColorConstant.lightGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(28),
                    ),
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
                              top: Get.height * 0.020,
                              bottom: Get.height * 0.006,
                            ),
                            child: Text(
                              "Name",
                              style: TextStyleConstant.semiBold16(),
                            ),
                          ),
                          CustomTextField(
                            controller: nameController,
                            hintText: " Enter Name",
                            textInputType: TextInputType.name,
                            prefixIcon: const Icon(Icons.person),
                            validator: FormValidationServices.validateField(
                                fieldName: "Name"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.020,
                              bottom: Get.height * 0.006,
                            ),
                            child: Text(
                              "Rent",
                              style: TextStyleConstant.semiBold16(),
                            ),
                          ),
                          TextField(
                            controller: rentController,
                            decoration: InputDecoration(
                              hintText: "Enter Rent Amount",
                              prefixIcon: Icon(Icons.real_estate_agent),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.020,
                              bottom: Get.height * 0.006,
                            ),
                            child: Text(
                              "Date",
                              style: TextStyleConstant.semiBold16(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: AbsorbPointer(
                              child: TextField(
                                controller: dateController,
                                decoration: InputDecoration(
                                  hintText: "Enter Date",
                                  prefixIcon: Icon(Icons.calendar_today),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.020,
                              bottom: Get.height * 0.006,
                            ),
                            child: Text(
                              "Remark",
                              style: TextStyleConstant.semiBold16(),
                            ),
                          ),
                          CustomTextField(
                            controller: remarkController,
                            hintText: " Enter Remark",
                            textInputType: TextInputType.text,
                            prefixIcon: const Icon(Icons.comment),
                            validator: FormValidationServices.validateField(
                                fieldName: "Remark"),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              title: "Save",
                              onTap: () {
                                if (controller.formKey.currentState!.validate()) {
                                  controller.addReceipt(
                                    orderNumber: orderNumberController.text, // Pass the correct order number
                                    socity: nameController.text,
                                    rentAmount: rentController.text,
                                    paidAmount: rentController.text, // Assuming paid amount is the same as rent
                                    paidDt: dateController.text,
                                    remark: remarkController.text,
                                  );
                                } else {
                                  customToast(message: "Data Not Submitted");
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
            ],
          );
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = pickedDate.toString();
      });
    }
  }
}
