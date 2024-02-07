import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCall {
  String basic;
  ApiCall(this.basic);
  Future postReq(Map<String, String> js, String address) async {
    String url = basic + address;
    Future<http.Response> response;
    response = http.post(
      Uri.parse(url),
      body: jsonEncode(js)
    );
    return response;
  }
}
