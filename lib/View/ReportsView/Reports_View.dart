import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/layout_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/select_city_controller.dart';
import 'package:yashvi_rentals/View/ReportsView/DepositeLisView.dart';
import 'package:yashvi_rentals/View/ReportsView/NoticeList_View.dart';
import 'DueList_View.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<SelectCityController>(
        init: SelectCityController(),
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
                    "Reports",
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildReportItem(
                        text: 'Due List',
                        onTap: () {
                          Get.to(DueListView());
                        },
                      ),
                      SizedBox(height: 10),
                      _buildReportItem(
                        text: 'Deposit List',
                        onTap: () {
                          Get.to(DepositeListView());
                        },
                      ),
                      SizedBox(height: 10),
                      _buildReportItem(
                        text: 'Notice List',
                        onTap: () {
                          Get.to(NoticeListView());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildReportItem({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        width: 400,
        child: Center(child: Text(text, style: TextStyleConstant.semiBold16())),
      ),
    );
  }
}
