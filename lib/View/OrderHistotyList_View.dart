import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/OrderHistory_Controller.dart';
import 'package:yashvi_rentals/Model/OrderHistory_Model.dart';


class OrderHistoryView extends StatefulWidget {
  final String orderNumber;

  OrderHistoryView({required this.orderNumber});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  late OrderHistoryController controller;

  @override
  void initState() {
    super.initState();
    controller =
        Get.put(OrderHistoryController(orderNumber: widget.orderNumber));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<OrderHistoryController>(
        init: controller,
        builder: (controller) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: height * 0.14,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Text(
                    "Order History",
                    style: TextStyleConstant.bold30(
                      color: ColorConstant.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.18,
                  bottom: height * 0.06,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 5),
                    Expanded(child: _buildOrderHistoryList(controller)),
                  ],
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
          4: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            children: [
              Text('Sr',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Society Name',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Rent Amount',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Paid Amount',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('Paid Date',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHistoryList(OrderHistoryController controller) {
    return ListView.builder(
      itemCount: controller.orderHistoryModel.orderReceiptList?.length ?? 0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            OrderHistoryItem(
              index: index + 1,
              orderReceipt:
                  controller.orderHistoryModel.orderReceiptList![index],
            ),
            Divider(height: 1, color: Colors.black),
          ],
        );
      },
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  final int index;
  final OrderReceipt orderReceipt;

  const OrderHistoryItem({required this.index, required this.orderReceipt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          4: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            children: [
              Text(index.toString(), textAlign: TextAlign.center),
              Text(orderReceipt.socity ?? '', textAlign: TextAlign.center),
              Text(orderReceipt.rentAmount ?? '', textAlign: TextAlign.center),
              Text(orderReceipt.paidAmount ?? '', textAlign: TextAlign.center),
              Text(orderReceipt.paidDt ?? '', textAlign: TextAlign.center),
            ],
          ),
        ],
      ),
    );
  }
}
