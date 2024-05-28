import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/Controllers/UserList_Controller.dart';
import 'package:yashvi_rentals/View/AddCutomer_form_view.dart';


class UserListView extends StatefulWidget {
  final UseListController controller = Get.put(UseListController());

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<UseListController>(
        init: UseListController(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: Get.height * 0.140,
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
                    "User List",
                    style: TextStyleConstant.bold30(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Get.height * 0.150,
                  bottom: Get.height * 0.060,
                  left: 16,
                  right: 16,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 4000,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: _buildSearchBox(), // Search box
                        ),
                        _buildHeader(), // Header Row
                        SizedBox(height: 10), // Space between header and list
                        _buildUserList(controller), // User List
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: FloatingActionButton(
                  onPressed: () {
                    // Handle add user action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCustomerFormView()),
                    );
                  },
                  child: Icon(Icons.add, color: ColorConstant.white),
                  backgroundColor: ColorConstant.brown,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Circular border
        border: Border.all(
            width: 1, color: Colors.indigo), // Border color and width
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.indigo),
            // Search icon
            SizedBox(width: 8),
            // Add some space between the icon and the text field
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  widget.controller
                      .filterNames(value); // Call method to filter names
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none, // Hide the border of the text field
                  hintStyle: TextStyle(color: Colors.indigo),
                ),
              ),
            ),
          ],
        ),
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
              Text('Cust Name',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('phone',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              Text('so Name',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
              // Text('Area', textAlign: TextAlign.center, style: TextStyleConstant.semiBold16()),
              Text('Actions',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.semiBold16()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderItem(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: Colors.black), // Vertical line
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleConstant.semiBold16(color: Colors.indigo),
        ),
      ),
    );
  }

  Widget _buildUserList(UseListController controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller?.getUserListModel.filteredNames?.length ?? 0,
      itemBuilder: (context, index) {
        return _buildUserItem(controller, index);
      },
    );
  }

  Widget _buildUserItem(UseListController controller, int index) {
    final user = controller.getUserListModel.filteredNames![index];
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
          4: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            children: [
              Text((index + 1).toString(), textAlign: TextAlign.center),
              Text(user.customerName ?? '', textAlign: TextAlign.center),
              Text(user.phone ?? '', textAlign: TextAlign.center),
              Text(user.socity ?? '', textAlign: TextAlign.center),
              // Text(user.area ?? '', textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: "View Quotation",
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.blue),
                      onPressed: () {
                        // Handle view quotation action
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
