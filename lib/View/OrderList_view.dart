import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/OrderList_Controller.dart';
import 'package:yashvi_rentals/Model/OrderList_Model.dart';
import 'package:yashvi_rentals/View/quatation.dart';
import 'OrderHistotyList_View.dart';
import 'whatsapp.dart';

class OrderListView extends StatefulWidget {
  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  final MaterialOrderListcontroller controller = Get.put(MaterialOrderListcontroller());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<MaterialOrderListcontroller>(
        init: MaterialOrderListcontroller(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: height * 0.14,
                width: width,
                decoration: BoxDecoration(
                  color: ColorConstant.brown,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Text(
                    "Order List",
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
                    Expanded(child: _buildOrderList(controller)),
                  ],
                ),
              ),
          //     Positioned(
          //       bottom: 20.0,
          //       right: 20.0,
          //       child: FloatingActionButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => OrderPlaceView()),
          //           );
          //         },
          // child: Icon(Icons.add,color:ColorConstant.white),
          // backgroundColor: ColorConstant.brown,
          //
          //       ),
          //     ),
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
          4: FlexColumnWidth(4.5),
        },
        children: [
          TableRow(
            children: [
              Text('Sr', textAlign: TextAlign.center, style: TextStyleConstant.semiBold16()),
              Text('Society Name', textAlign: TextAlign.center, style: TextStyleConstant.semiBold16()),
              Text('Rent Amount', textAlign: TextAlign.center, style: TextStyleConstant.semiBold16()),
              Text('De Ammount', textAlign: TextAlign.center, style: TextStyleConstant.semiBold16()),
              Text('Actions', textAlign: TextAlign.center, style: TextStyleConstant.semiBold16()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList(MaterialOrderListcontroller controller) {
    return ListView.builder(
      itemCount: controller.materialOrderListModel.orderList?.length ?? 0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            OrderItem(
              index: index + 1,
              order: controller.materialOrderListModel.orderList![index],
            ),
            Divider(height: 1, color: Colors.black),
          ],
        );
      },
    );
  }
}


class OrderItem extends StatelessWidget {
  final int index;
  final Order? order;

  const OrderItem({required this.index, required this.order});

  @override
  Widget build(BuildContext context) {
    if (order == null) {
      return Container();
    }

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
          4: FlexColumnWidth(5),
        },
        children: [
          TableRow(
            children: [
              Text(index.toString(), textAlign: TextAlign.center),
              Text(order!.customerName ?? '', textAlign: TextAlign.center),
              Text(order!.rentAmount ?? '', textAlign: TextAlign.center),
              Text(order!.depositeAmount ?? '', textAlign: TextAlign.center),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: "View Quotation",
                    child: IconButton(
                      icon: Icon(Icons.picture_as_pdf, color: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuatationClass(order: order),
                          ),
                        );
                      },
                    ),
                  ),
                  Tooltip(
                    message: "Delete Order",
                    child: IconButton(
                      icon: Icon(Icons.call, color: Colors.red),
                      onPressed: () {
                        // Handle delete action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WhatsAppView(),
                          ),
                        );
                      },
                    ),
                  ),
                  Tooltip(
                    message: "Call Customer",
                    child: IconButton(
                      icon: Icon(Icons.history, color: Colors.green),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderHistoryView(orderNumber: order!.orderNumber ?? ''),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


