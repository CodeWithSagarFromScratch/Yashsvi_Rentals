import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';


class WhatsAppView extends StatefulWidget {
  const WhatsAppView({Key? key}) : super(key: key);

  @override
  _WhatsAppViewState createState() => _WhatsAppViewState();
}

class _WhatsAppViewState extends State<WhatsAppView> {
  var phone = "";
  var msg = "";
  var code = "+91";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp View"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CountryCodePicker(
                  onChanged: (val) {
                    code = val.toString();
                  },
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  favorite: ['+91', 'IN'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  phone = value;
                },
                decoration: InputDecoration(
                    fillColor: Colors.teal,
                    focusColor: Colors.teal,
                    hoverColor: Colors.teal,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Phone"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  msg = value;
                },
                decoration: InputDecoration(
                    fillColor: Colors.teal,
                    focusColor: Colors.teal,
                    hoverColor: Colors.teal,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Message"),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
                elevation: 5,
                child: MaterialButton(
                  child: const Text(
                    'Send',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    // https://wa.me/1XXXXXXXXXX?text=I'm%20interested%20in%20your%20car%20for%20sale

                    if (phone.length < 10) {
                      Fluttertoast.showToast(
                          msg: "Enter a valid phone number",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          webPosition: "center",
                          fontSize: 16.0);
                    } else {
                      code = code.replaceAll("+", "");

                      var url = "https://wa.me/$code$phone?text=$msg";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw "Could not launch $url";
                      }
                      // print(code);
                    }
                  },
                  minWidth: 130,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
