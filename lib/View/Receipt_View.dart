import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/OrderList_Controller.dart';
import 'package:yashvi_rentals/Model/OrderList_Model.dart';
import 'ReceiptSave_View.dart';
// Ensure you import the correct file

class ReceiptViewPage extends StatelessWidget {
  final MaterialOrderListcontroller controller =
      Get.put(MaterialOrderListcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<MaterialOrderListcontroller>(
        init: MaterialOrderListcontroller(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: Get.height * 0.140,
                width: Get.width,
                decoration: BoxDecoration(
                  color: ColorConstant.brown,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.050),
                  child: Text(
                    "Receipt",
                    style: TextStyleConstant.bold30(
                      color: ColorConstant.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Get.height * 0.200,
                  bottom: Get.height * 0.060,
                  left: 16,
                  right: 16,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        SizedBox(height: 10),
                        _buildOrderList(controller),
                      ],
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

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(5),
        },
        children: [
          TableRow(
            children: [
              Text('Sr',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Name',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Date',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Code',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Rent',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList(MaterialOrderListcontroller controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.materialOrderListModel.orderList?.length ?? 0,
      itemBuilder: (context, index) {
        final order = controller.materialOrderListModel.orderList![index];
        return GestureDetector(
          onTap: () {
            Get.to(ReceiptSaveView(
              username: order.customerName ?? '',
              rent: order.rentAmount ?? '',
              date: order.orderDt ?? '',
              orderNumber: order.orderNumber ?? '', // Pass the order number
            ));
          },
          child: Column(
            children: [
              OrderItem(
                index: index + 1,
                order: order,
              ),
              Divider(height: 1, color: Colors.black),
            ],
          ),
        );
      },
    );
  }
}

class OrderItem extends StatelessWidget {
  final int index;
  final Order order;

  const OrderItem({required this.index, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(5),
        },
        children: [
          TableRow(
            children: [
              Text(index.toString(), textAlign: TextAlign.center),
              Text(order.customerName ?? '', textAlign: TextAlign.center),
              Text(order.orderDt ?? '', textAlign: TextAlign.center),
              Text(order.customerCode ?? '', textAlign: TextAlign.center),
              Text(order.rentAmount ?? '', textAlign: TextAlign.center),
            ],
          ),
        ],
      ),
    );
  }
}
