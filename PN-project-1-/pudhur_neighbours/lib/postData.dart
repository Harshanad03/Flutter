// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> postData(
  String endpoint, {
  String host = "https://Saranesh.pythonanywhere.com",
  Map queryParams = const {},
  Map jsonBody = const {},
}) async {
  List params = [];
  // List<Map<dynamic, dynamic>> jsonData = [];
  queryParams.forEach((key, value) {
    params.add("$key=$value");
  });
  final response = await http.post(
    Uri.parse("$host$endpoint?" + params.join('&')),
    body: jsonEncode(jsonBody),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  // // final jsonData = json.decode(response.body);
// print(response.body);
  return jsonDecode(response.body);

  // return;
}
