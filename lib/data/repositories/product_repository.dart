// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tracking_app/data/model/product_model.dart';
import 'package:tracking_app/utils/constants.dart';

class ProductRepository {
  Future<List<ProductModel>> getNewestProduct() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}api/Product/GetNewProducts"),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Check if the response has the $values key
        if (jsonResponse.containsKey('\$values')) {
          print("Contains Value: ${jsonResponse.containsKey('\$values')}");
          // Parse the $values array
          List<dynamic> productList = jsonResponse['\$values'];
          print("ProductList: ${jsonResponse['\$values']}");
          return productList
              .map((product) => ProductModel.fromJson(product))
              .toList();
        } else if (jsonResponse.containsKey('\$id') &&
            jsonResponse.containsKey('\$values')) {
          // Alternative structure with nested $values
          List<dynamic> brandList = jsonResponse['\$values'];
          return brandList
              .map((product) => ProductModel.fromJson(product))
              .toList();
        } else {
          throw Exception('Unexpected JSON structure: ${response.body}');
        }
      } else {
        throw Exception('Failed to load brands: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
