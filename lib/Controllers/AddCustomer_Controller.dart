import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:yashvi_rentals/Constant/endpoint_constant.dart';
import 'package:yashvi_rentals/Model/Post_AddCustomer_Model.dart';
import 'package:yashvi_rentals/View/Order_place%20_View.dart';
import 'package:yashvi_rentals/Widgets/custom_loader.dart';
import 'package:yashvi_rentals/Widgets/custom_toast.dart';
import 'dart:io' as io;


import 'UserList_Controller.dart';
// Import UseListController

class PostAddCustomerController extends GetxController {
  PostCustomerModel postCustomerModel = PostCustomerModel();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController socitynameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController adharnoController = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();
  TextEditingController name1Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  io.File? selectedImage1;
  io.File? selectedImage2;
  io.File? selectedImage3;
  io.File? selectedImage4;

  Future<void> pickImage(
      {required int imageNo, required ImageSource imageSource}) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSource);

    if (pickedImage?.path != null) {
      if (imageNo == 1) {
        selectedImage1 = io.File(pickedImage!.path);
      } else if (imageNo == 2) {
        selectedImage2 = io.File(pickedImage!.path);
      } else if (imageNo == 3) {
        selectedImage3 = io.File(pickedImage!.path);
      } else if (imageNo == 4) {
        selectedImage4 = io.File(pickedImage!.path);
      }
    } else {
      log("No image selected");
    }
  }

  Future<void> postCustomer() async {
    CustomLoader.openCustomLoader();
    try {
      var header = {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };

      log("username ::: ${phoneController.text}");
      log("name ::: ${nameController.text}");
      // log("email_address ::: ${emailController.text}");
      log("socity ::: ${socitynameController.text}");
      log("area ::: ${areaController.text}");
      log("adhar_no ::: ${adharnoController.text}");
      log("phone1 ::: ${phone1Controller.text}");
      log("name1 ::: ${name1Controller.text}");
      log("phone2 ::: ${phone2Controller.text}");
      log("name2 ::: ${name2Controller.text}");
      log("pan_image ::: ${selectedImage1?.path}");
      log("document_img ::: ${selectedImage2?.path}");

      var request = http.MultipartRequest('POST',
          Uri.parse("${EndPointConstant.baseUrl}${EndPointConstant.addUser}"));
      request.headers.addAll(header);

      request.fields['phone'] = phoneController.text;
      request.fields['customer_name'] = nameController.text;
      // request.fields['email'] = emailController.text;
      request.fields['area'] = areaController.text;
      request.fields['socity'] = socitynameController.text;
      request.fields['adhar_no'] = adharnoController.text;
      request.fields['phone1'] = phone1Controller.text;
      request.fields['name1'] = name1Controller.text;
      request.fields['phone2'] = phone2Controller.text;
      request.fields['name2'] = name2Controller.text;

      request.files.add(await http.MultipartFile.fromPath(
          "pan_image", "${selectedImage1?.path}"));
      request.files.add(await http.MultipartFile.fromPath(
          "document_img", "${selectedImage2?.path}"));
      // request.files.add(await http.MultipartFile.fromPath(
      //     "image3", "${selectedImage3?.path}"));
      // request.files.add(await http.MultipartFile.fromPath(
      //     "image4", "${selectedImage4?.path}"));

      var response = await request.send();
      var responsed = await http.Response.fromStream(response);
      log("Post address response ::: ${responsed.body}");

      if (responsed.statusCode == 200 || responsed.statusCode == 201) {
        // Successfully added customer
        CustomLoader.closeCustomLoader();
        customToast(message: "Customer added successfully!");

        Get.to(() => OrderPlaceView(
              socityName: socitynameController.text,
            ));

        // Refresh user list after adding a new customer
        Get.find<UseListController>().GetUserList();
      } else {
        CustomLoader.closeCustomLoader();
        customToast(message: "Failed to add customer. Please try again.");
      }
    } catch (error, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during posting address ::: $error");
      log("Error location during posting address ::: $st");
    }
  }
}
