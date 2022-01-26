import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:numberfact/number_class/number_class.dart';

class GetDataResult {
  getData({required String number}) async {
    http.Response response = await http.get(
      Uri.parse("http://numbersapi.com/$number?json"),
    );
    final value = jsonDecode(response.body) as Map<String, dynamic>;
    final data = NumberClass.fromJson(value);
    return data;
  }
}
