import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:yashvi_rentals/apiData.dart/loginApi.dart';



class SalesQuatationProvider with ChangeNotifier {
  bool _loader = false;
  List _quatationListData = [];

  bool get loader => _loader;

  List get quatationListData => _quatationListData;

  loaderResponse(bool value) {
    log("check:-" + value.toString());
    _loader = value;
    notifyListeners();
  }

  postApiQuatationValue(body, url, context) {
    loaderResponse(true);
    postApi(body, url).then((responseVal) async {
      if (responseVal == null) {
        log("No Data Found");
        snackBarShow("No Data Found", context);
        loaderResponse(false);
      } else {
        try {
          loaderResponse(true);

          notifyListeners();

          Map<String, dynamic> jsonData = jsonDecode(responseVal);

          if (jsonData["status"].toString().toLowerCase() == "success") {
            _quatationListData = jsonData["Quotation_list"];
            notifyListeners();
            log("Post quotation data response ::: $_quatationListData");
            loaderResponse(false);
            notifyListeners();
          } else {
            snackBarShow(jsonData["message"].toString(), context);
            loaderResponse(false);
            snackBarShow(jsonData["message"].toString(), context);
            notifyListeners();
          }
        } catch (e) {
          log(e.toString());
        }
      }
    });
  }

  snackBarShow(String textData, context) {
    final snackBar = SnackBar(
      content: Text(textData),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
