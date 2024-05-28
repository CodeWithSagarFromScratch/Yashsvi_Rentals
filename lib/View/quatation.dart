import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';
import 'package:yashvi_rentals/Model/OrderList_Model.dart';


import 'OrderList_view.dart';

class QuatationClass extends StatefulWidget {
  final Order? order;

  const QuatationClass({Key? key, this.order}) : super(key: key);

  @override
  _QuatationClassState createState() => _QuatationClassState();
}

class _QuatationClassState extends State<QuatationClass> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotation List"),
      ),
      body: widget.order == null
          ? Center(child: Text("No Data Found"))
          : ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return quatationCardList(widget.order!);
              },
            ),
    );
  }

  Widget quatationCardList(Order order) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: () => generatePDF(order),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                order.customerName ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Phone: ${order.orderDt ?? ''}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Quotation number: ${order.customerCode ?? ''}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Quotation date: ${order.orderNumber ?? ''}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Total quotation: ${order.rentAmount ?? ''}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () async {
                  var fullUrlLink =
                      "https://softebuild.com/rent_management_app/api/print_order.php?order_number=${order.orderNumber}";

                  var url = Uri.parse(fullUrlLink);
                  if (await canLaunch(url.toString())) {
                    await launch(url.toString());
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Icon(Icons.print),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> generatePDF(Order order) async {
    final pdf = pw.Document();
    final fontData =
        await rootBundle.load("assets/fonts/Noto_sans/notosans-regular.ttf");
    final ttfFont = pw.Font.ttf(fontData);

    // Example of fetching order items (replace with your actual implementation)
    // List<OrderItem> orderItems = await fetchOrderItems(order.orderNumber);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            margin: const pw.EdgeInsets.all(10),
            padding: const pw.EdgeInsets.all(10),
            decoration: const pw.BoxDecoration(),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text("Quotation Number: ${order.customerCode}",
                    style: pw.TextStyle(font: ttfFont, fontSize: 18)),
                pw.Text("Quotation Date: ${order.orderDt}",
                    style: pw.TextStyle(font: ttfFont, fontSize: 18)),
                pw.Text("Company Name: ${order.customerName}",
                    style: pw.TextStyle(font: ttfFont, fontSize: 18)),
                pw.Text("Company Code: ${order.customerCode}",
                    style: pw.TextStyle(font: ttfFont, fontSize: 18)),
                pw.Text("Phone: ${order.orderDt}",
                    style: pw.TextStyle(font: ttfFont, fontSize: 18)),
                pw.Text("Total: ${order.rentAmount}",
                    style: pw.TextStyle(font: ttfFont, fontSize: 18)),
                pw.SizedBox(height: 20),
                pw.Text("Order Items",
                    style: pw.TextStyle(
                        font: ttfFont,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                // for (var item in orderItems)
                //   pw.Text("${item.productName} - ${item.quantity} x ${item.unitPrice}", style: pw.TextStyle(font: ttfFont, fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/quotation.pdf");
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('PDF saved at ${file.path}')));
  }

  // Example method to fetch order items (replace with your actual implementation)
  Future<List<OrderItem>> fetchOrderItems(String orderNumber) async {
    // Replace this with your actual API call to fetch order items based on orderNumber
    // For demonstration, returning a dummy list
    return [
      // OrderItem(productName: 'Product A', quantity: 2, unitPrice: 100),
      // OrderItem(productName: 'Product B', quantity: 1, unitPrice: 50),
    ];
  }
}
