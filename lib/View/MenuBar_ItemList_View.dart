import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/layout_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/profile_details_controller.dart';
import 'Authentication_Section/login_view.dart';
import 'AddCutomer_form_view.dart';

class MenuBarItemList extends StatelessWidget {
  const MenuBarItemList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                    top: Get.height * 0.050,
                    left: screenWidthPadding,
                    right: screenWidthPadding,
                  ),
                  height: Get.height * 0.350,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: ColorConstant.indigo,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: TextStyleConstant.bold30(
                            color: ColorConstant.white),
                      ),
                      // Container(
                      //   padding: contentPadding,
                      //   height: Get.height * 0.057,
                      //   width: Get.width * 0.300,
                      //   decoration: BoxDecoration(
                      //     color: ColorConstant.white,
                      //     borderRadius: BorderRadius.circular(16),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "Pune",
                      //         style: TextStyleConstant.semiBold18(
                      //             color: ColorConstant.darkGrey),
                      //       ),
                      //       const Icon(Icons.pin_drop,
                      //           color: ColorConstant.darkGrey),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: screenPadding,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.100),
                        child: Container(
                          padding: screenPadding,
                          height: Get.height * 0.800,
                          decoration: BoxDecoration(
                            color: ColorConstant.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: Get.height * 0.100,
                                      width: Get.width * 0.200,
                                      decoration: const BoxDecoration(
                                        color: ColorConstant.lightGrey,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: ColorConstant.white,
                                        size: Get.width * 0.150,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Get.width * 0.030),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.person,
                                                  color:
                                                      ColorConstant.redAccent),
                                              Text(
                                                controller
                                                        .getProfileDetailmodel
                                                        .profileList
                                                        ?.first
                                                        .name ??
                                                    "",
                                                style: TextStyleConstant
                                                    .semiBold18(
                                                        color: ColorConstant
                                                            .darkGrey),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Get.height * 0.010),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.mail,
                                                    color: ColorConstant
                                                        .redAccent),
                                                Text(
                                                  controller
                                                          .getProfileDetailmodel
                                                          .profileList
                                                          ?.first
                                                          .emailAddress ??
                                                      "",
                                                  style: TextStyleConstant
                                                      .semiBold16(
                                                          color: ColorConstant
                                                              .darkGrey),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.webhook_sharp,
                                                  color:
                                                      ColorConstant.redAccent),
                                              Text(
                                                "demowebsite.com",
                                                style: TextStyleConstant
                                                    .semiBold16(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                customFieldContainer(
                                  iconData: Icons.person,
                                  title: "Master Form View",
                                  onTap: () =>
                                      Get.to(() => const AddCustomerFormView()),
                                ),
                                // customFieldContainer(
                                //     iconData: Icons.auto_graph,
                                //     title: "Invoice Receipt ",
                                //   onTap: () => Get.to(() => const  InviceReceipt_view()),
                                // ),
                                // customFieldContainer(
                                //     iconData: Icons.history,
                                //     title: "Order History"),

                                // customFieldContainer(
                                //   iconData: Icons.map,
                                //   title: "Order Place",
                                //   onTap: () =>
                                //       Get.to(() => OrderPlaceView()
                                //       ),
                                // ),
                                // customFieldContainer(
                                //   iconData: Icons.map,
                                //   title: "OrderList View ",
                                //   onTap: () =>
                                //       Get.to(() => OrderListView()
                                //       ),
                                // ),
                                // customFieldContainer(
                                //   iconData: Icons.map,
                                //   title: "Receipt View",
                                //   onTap: () =>
                                //       Get.to(() => ReceiptViewPage()
                                //       ),
                                // ),
                                // customFieldContainer(
                                //   iconData: Icons.map,
                                //   title: "UserProFile",
                                //   onTap: () =>
                                //       Get.to(() => UserProFileView(username: '', rent: '', date: '',)
                                //       ),
                                // ),
                                //  onTap: () => Get.to(() =>  ActiveScreen(userId: '',)),),
                                customFieldContainer(
                                  iconData: Icons.call,
                                  title: "Contact Us",
                                  // onTap: () =>
                                  // Get.to(() => ContactUsView())
                                ),
                                customFieldContainer(
                                  iconData: Icons.info, title: "About Us",
                                  // onTap: () =>
                                  //     Get.to(() => AboutsUsView()
                                  //     ),
                                ),
                                customFieldContainer(
                                    iconData: Icons.recycling, title: "Help"),
                                customFieldContainer(
                                  iconData: Icons.logout,
                                  title: "Logout",
                                  onTap: () => Get.to(() => const LoginView()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget customFieldContainer({
    required IconData iconData,
    required String title,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: contentPadding,
        height: Get.height * 0.060,
        // decoration: BoxDecoration(
        //   border: Border.all(width: 2, color: ColorConstant.redAccent),
        //   borderRadius: BorderRadius.circular(12),
        // ),
        child: Row(
          children: [
            Icon(iconData, color: ColorConstant.redAccent),
            SizedBox(width: Get.width * 0.025),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title,
                  style: TextStyleConstant.semiBold16(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            //   Icon(Icons.arrow_forward_ios_rounded, color: ColorConstant.redAccent),
          ],
        ),
      ),
    );
  }
}
