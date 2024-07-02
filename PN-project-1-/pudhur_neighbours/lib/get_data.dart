import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pn/http_error.dart';

Future<List> getData(
  String endpoint, {
  String host = "https://Saranesh.pythonanywhere.com",
}) async {
  List params = [];
  List jsonData = [];

  try {
    final response = await http.get(
      Uri.parse("$host$endpoint"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData);
    } else {
      throw InvalidResponseException();
    }
  } catch (e) {
    print(e.toString());
  }
  return jsonData;
}
