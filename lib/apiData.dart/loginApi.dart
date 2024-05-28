import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

postApiLogin(body, String url) async {
  log("Post login response body ::: $body");
  log("Post login request url ::: $url");

  try {
    var encoding = Encoding.getByName('utf-8');
    Map<String, String> headers = {
      "Content-Type": " application/x-www-form-urlencoded"
    };
    final response = await http
        .post(
          Uri.parse(url),
          headers: headers,
          encoding: encoding,
          // Duration(seconds: 20),
          body: (body),
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode == 200) {
      var responseVal = response.body;

      log("Post login response data ::: $responseVal");
      return responseVal;
    } else {
      log("Post login response reason phrase ::: ${response.reasonPhrase}");
    }
  } catch (e) {
    log("Something went wrong during login ::: $e");
  }
}

postApi(body, String url) async {
  log("body:-$body");
  log("url:-$url");

  try {
    var encoding = Encoding.getByName('utf-8');
    Map<String, String> headers = {
      "Content-Type": " application/x-www-form-urlencoded"
    };
    final response = await http
        .post(
          Uri.parse(url),
          headers: headers,
          encoding: encoding,
          // Duration(seconds: 20),
          body: (body),
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode == 200) {
      var responseVal = response.body;

      log("jsondataResponse1:-$responseVal");
      return responseVal;
    } else {
      print("qqq" + "${response.reasonPhrase}");
    }
  } catch (e) {
    log("exception Handle:-$e");
  }
}
