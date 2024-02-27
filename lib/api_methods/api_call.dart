import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCall {
  String basic = "http://192.168.55.33:3000";
  ApiCall();
  Future<http.Response> postReq(Map<String, String> js, String address) async {
    String url = basic + address;
    http.Response response;
    response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: json.encode(js),
    );
    return response;
  }
}
