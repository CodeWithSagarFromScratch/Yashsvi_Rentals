import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:yashvi_rentals/Widgets/app_locals.dart';


class DueListView extends StatefulWidget {
  const DueListView({super.key});

  @override
  State<DueListView> createState() => _DueListViewState();
}

class _DueListViewState extends State<DueListView> {
  String selectedStartDate = "";
  String selectedEndDate = "";
  DateTime initialDateTime = DateTime.now();

  // Future<void> startUrl() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //
  //   String customerCode =
  //       "${preferences.getString(AllSharedPreferencesKey.usernameCompany)}";
  //
  //   log("Final url ::: https://meradaftar.com/authentic_erp/api/print_daily5_part2.php?from_dt=$selectedStartDate&to_dt=$selectedEndDate&customer_code=$customerCode");
  //
  //   if (!await launchUrl(Uri.parse(
  //       "https://meradaftar.com/authentic_erp/api/print_daily5_part2.php?from_dt=$selectedStartDate&to_dt=$selectedEndDate&customer_code=$customerCode"))) {
  //     throw Exception('Could not launch');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocale.employeeDetails.getString(context))),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: initialDateTime,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );

                    if (dateTime != null) {
                      setState(() {
                        selectedStartDate = "$dateTime";
                        selectedStartDate = selectedStartDate.split(" ")[0];
                      });
                    }
                  },
                  child: (selectedStartDate == "")
                      ? Text(AppLocale.selectStartDate.getString(context))
                      : Text(selectedStartDate)),
            ),
            ElevatedButton(
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: initialDateTime,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );

                  if (dateTime != null) {
                    setState(() {
                      selectedEndDate = "$dateTime";
                      selectedEndDate = selectedEndDate.split(" ")[0];
                    });
                  }
                },
                child: (selectedEndDate == "")
                    ? Text(AppLocale.selectEndDate.getString(context))
                    : Text(selectedEndDate)),
            ElevatedButton(
                onPressed: () {
                  if (selectedStartDate != "") {
                    if (selectedEndDate != "") {
                      //  startUrl();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
                          content: Text(
                              AppLocale.selectEndDate.getString(context)))));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar((SnackBar(
                        content: Text(
                            AppLocale.selectStartDate.getString(context)))));
                  }
                },
                child: Text(AppLocale.submit.getString(context))),
          ],
        ),
      ),
    );
  }
}
