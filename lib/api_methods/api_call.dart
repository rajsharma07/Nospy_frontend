import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCall {
  String basic = "/localhost";
  ApiCall();
  Future<http.Response> postReq(Map<String, String> js, String address) async {
    String url = basic + address;
    http.Response response;
    response = await http.post(
      Uri.parse(url),
      body: jsonEncode(js)
    );
    return response;
  }
}
