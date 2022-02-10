import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Foodmodel.dart';

class ControllerFood {
  static Future<List<dynamic>> getfood(String country) async {
    final url = Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?cuisine=${country}&apiKey=c40dbe94afa34a6cbb66d162be9317d5");
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> data = jsonData["results"];
    List<modelfood> foodList = [];
    for (var f in data) {
      modelfood mfood = modelfood(f["id"], f["image"], f["title"]);
      foodList.add(mfood);
    }
    return foodList.toList();
  }
}
