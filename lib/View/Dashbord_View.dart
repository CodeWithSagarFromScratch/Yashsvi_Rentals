import 'package:flutter/material.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';
import 'package:yashvi_rentals/Constant/image_path_constant.dart';
import 'package:yashvi_rentals/Constant/layout_constant.dart';
import 'package:yashvi_rentals/Constant/textstyle_constant.dart';
import 'package:yashvi_rentals/View/UserList_View.dart';
import 'OrderList_view.dart';
import 'Receipt_View.dart';
import 'ReportsView/Reports_View.dart';

class DashboardViewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
         // backgroundColor: ColorConstant.bl,
          backgroundColor: ColorConstant.brown,
          title: Text(
            'Dashboard',
            style: TextStyle(
              color: ColorConstant.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white), // Set menu icon color to white
        ),

        // drawer: Drawer(
        //   child: Container(
        //     width: MediaQuery.of(context).size.width * 0.7,
        //     // Adjusted width
        //     child: MenuBarItemList(),
        //   ),
        // ),
        body: HomePage(),
      ),
      routes: {
        '/offlineCourses': (context) => UserListView(),
        '/onlineCourses': (context) => OrderListView(),
        '/Receipt': (context) => ReceiptViewPage(),
        '/Reports': (context) => ReportsView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    color: ColorConstant.white,
                    height: 180,
                    width: 200,
                    padding: screenPadding,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(8.0),
                    //   border: Border.all(
                    //     color: Colors.grey, // Set border color to gray
                    //     width: 1.0, // Set border width
                    //   ),
                    // ),
                    child: CategoryItem(
                      iconData: Icons.person,
                      description: 'USERS',
                      route: '/offlineCourses',
                      descriptionColor: ColorConstant.white,
                      iconColor: ColorConstant.brown,
                    ),
                  ),
                  SizedBox(width:10),
                  Container(
                    color: ColorConstant.white,
                    height: 180,
                    width: 200,
                    padding: screenPadding,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(8.0),
                    //   border: Border.all(
                    //     color: Colors.grey, // Set border color to gray
                    //     width: 1.0, // Set border width
                    //   ),
                    // ),
                    child: CategoryItem(
                    //  imagePath: ImagePathConstant.Order,
                      iconData: Icons.shopping_cart,
                      description: 'Orders',
                      route: '/onlineCourses',
                      iconColor: ColorConstant.brown,
                      descriptionColor: ColorConstant.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height:8,),
          Row(
            children: [
            //  SizedBox(width:10),
              Container(
                color: ColorConstant.white,
                height: 180,
                width: 200,
                padding: screenPadding,
                child:
                CategoryItem(
                  iconData: Icons.receipt,
                  description: 'RECEIPTS',
                  route: '/Receipt',
                  iconColor: ColorConstant.brown,
                  descriptionColor: ColorConstant.white,// Specify icon color
                ),
              ),
              SizedBox(width:10),
              Container(
                color: ColorConstant.white,
                height: 180,
                width: 200,
                padding: screenPadding,
                child: CategoryItem(
                  iconData: Icons.report,
                  description: 'REPORTS',
                  route: '/Reports',
                  iconColor: ColorConstant.brown,
                  descriptionColor: ColorConstant.brown,
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            color: Colors.cyanAccent,
            height: 300,
            width: 400,
            child: Image.asset(
              ImagePathConstant.dashbord,
              width: 400,
              height: 300,
              fit: BoxFit.fill, // This will stretch the image to fit the container
            ),
          ),


        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData iconData;
  final String description;
  final String route;
  final double iconSize;
  final Color iconColor;
  final Color descriptionColor;// New property to specify icon color

  const CategoryItem({
    required this.iconData,
    required this.description,
    required this.route,
    required this.descriptionColor,
    this.iconSize = 80,
    this.iconColor = Colors.black, // Default icon color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey, // Border color
            width: 1.0, // Border width
          ),
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              size: iconSize,
              color: iconColor, // Set icon color
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyleConstant.semiBold24(color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}


