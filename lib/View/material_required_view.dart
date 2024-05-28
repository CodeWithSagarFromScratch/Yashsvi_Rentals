// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rent_management/Constant/color_constant.dart';
// import 'package:rent_management/Constant/textstyle_constant.dart';
// import 'package:rent_management/Controllers/material_required_controller.dart';
// import 'package:rent_management/Services/form_validation_services.dart';
// import 'package:rent_management/Widgets/custom_button.dart';
// import 'package:rent_management/Widgets/custom_textfield.dart';
// import 'package:rent_management/Widgets/custom_toast.dart';
//
// class MaterialRequiredView extends StatefulWidget {
//   const MaterialRequiredView({super.key});
//
//   @override
//   State<MaterialRequiredView> createState() => _MaterialRequiredViewState();
// }
//
// class _MaterialRequiredViewState extends State<MaterialRequiredView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: CustomAppBar(
//       //   title: "Material Required",
//       //   leading: IconButton(
//       //       onPressed: () => Get.back(),
//       //       icon: const Icon(
//       //         Icons.arrow_back,
//       //         color: ColorConstant.white,
//       //       )),
//       // ),
//       body: GetBuilder<MaterialRequiredController>(
//           init: MaterialRequiredController(),
//           builder: (controller) {
//             return
//               Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: Get.height * 0.018, horizontal: Get.width * 0.038),
//               child: Column(
//                 children: [
//                   Card(
//                     child: ListTile(
//                       onTap: () {
//                         Get.dialog(Material(
//                           child: Container(
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 color: ColorConstant.white,
//                                 borderRadius: BorderRadius.circular(16)),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                         onPressed: () => Get.back(),
//                                         icon: const Icon(Icons.arrow_back)),
//                                     Text(
//                                       "Select Material Item",
//                                       style: TextStyleConstant.semiBold30(),
//                                     ),
//                                   ],
//                                 ),
//                                 Expanded(
//                                   child: ListView.builder(
//                                     physics: const BouncingScrollPhysics(),
//                                     itemCount: controller.getMaterialRequiredModel
//                                         .itemList?.length,
//                                     itemBuilder: (context, index) {
//                                       return Card(
//                                         child: ListTile(
//                                             onTap: () {
//                                               controller.selectMaterial.value =
//                                                   "${controller.getMaterialRequiredModel.itemList?[index].itemname}";
//                                               controller.selectUnit.value =
//                                                   "${controller.getMaterialRequiredModel.itemList?[index].unit}";
//                                               controller.selectCategory.value =
//                                                   "${controller.getMaterialRequiredModel.itemList?[index].category}";
//                                               controller.selectCode.value =
//                                                   "${controller.getMaterialRequiredModel.itemList?[index].code}";
//                                               controller.selectId.value =
//                                                   "${controller.getMaterialRequiredModel.itemList?[index].id}";
//                                               Get.back();
//                                               controller.update();
//                                             },
//                                             title: Text(
//                                                 "${controller.getMaterialRequiredModel.itemList?[index].itemname}")),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ));
//                       },
//                       title: Text(controller.selectMaterial.value),
//                       trailing: const Icon(Icons.arrow_drop_down),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: Get.height * 0.020),
//                     child: ListTile(
//                       title: Text(
//                         controller.selectUnit.value,
//                         style: TextStyle(color: ColorConstant.lightGrey),
//                       ),
//                     ),
//                   ),
//                   Form(
//                     key: controller.formKey,
//                     child: CustomTextField(
//                       controller: controller.quantityController,
//                       hintText: "Enter Quantity",
//                       prefixIcon:
//                           const Icon(Icons.production_quantity_limits_rounded),
//                       textInputType: TextInputType.number,
//                       validator: FormValidationServices.validateField(
//                           fieldName: "Quantity"),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: Get.height * 0.020),
//                     child: CustomButton(
//                       title: "Add to List",
//                       width: Get.width * 0.500,
//                       onTap: () {
//                         if (controller.formKey.currentState!.validate()) {
//                           controller.createdMaterialItemList.add({
//                             "cartId": controller.selectCode.value,
//                             "id": controller.selectId.value,
//                             "itemname": controller.selectMaterial.value,
//                             "code": controller.selectCode.value,
//                             "quantity": controller.quantityController.text,
//                             "unit": controller.selectUnit.value,
//                           });
//                           controller.update();
//                         }
//                       },
//                     ),
//                   ),
//                   Obx(() {
//                     return Expanded(
//                         child: ListView.builder(
//                       itemCount: controller.createdMaterialItemList.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: ListTile(
//                             title: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0), // Adjust the spacing as needed
//                                   child: Text(
//                                     "Item Name: ${controller.createdMaterialItemList[index]["itemname"]}",
//                                   ),
//                                 ),
//                                 // You can use a VerticalDivider widget here
//                                 // VerticalDivider(
//                                 //   color: Colors.black, // Adjust the color as needed
//                                 //   thickness: 1, // Adjust the thickness as needed
//                                 //   width: 5, // Adjust the width as needed
//                                 // ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:2.0), // Adjust the spacing as needed
//                                   child: Text(
//                                     "Quantity: ${controller.createdMaterialItemList[index]["quantity"]}",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             trailing: IconButton(
//                                 onPressed: () {
//                                   controller.createdMaterialItemList
//                                       .removeAt(index);
//                                   controller.update();
//                                 },
//                                 icon: const Icon(Icons.close)),
//                           ),
//                         );
//                       },
//                     ));
//                   }),
//                   CustomButton(
//                     title: "Submit",
//                     onTap: () {
//                       if (controller.createdMaterialItemList.isNotEmpty) {
//                         controller.OrderPlaceItmeList();
//                       } else {
//                         customToast(
//                             message: "Please Add At Least 1 Material List");
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
