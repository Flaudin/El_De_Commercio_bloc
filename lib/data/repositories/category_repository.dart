// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:tracking_app/data/model/category_model.dart';
import 'package:tracking_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  final String apiUrl = '${baseUrl}api/Category/GetAllCategories';

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      print("Fetching categoreis from: $apiUrl");
      final response = await http
          .get(Uri.parse(apiUrl), headers: {'Content-Type': 'application/json'})
          .timeout(
            Duration(seconds: 10),
            onTimeout: () {
              throw Exception("Connection timeout");
            },
          );
      print("Status code ${response.statusCode}");
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load categories: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
