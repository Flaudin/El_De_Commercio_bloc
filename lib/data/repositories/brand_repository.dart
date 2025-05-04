import 'dart:convert';

import 'package:tracking_app/data/model/brand_model.dart';
import 'package:http/http.dart' as http;
import 'package:tracking_app/utils/constants.dart';

class BrandRepository {
  Future<List<BrandModel>> fetchPopularBrands() async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}api/Brand/GetPopularBrands"),
      );

      if (response.statusCode == 200) {
        // Parse the response
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Check if the response has the $values key
        if (jsonResponse.containsKey('\$values')) {
          print("Contains Value: ${jsonResponse.containsKey('\$values')}");
          // Parse the $values array
          List<dynamic> brandList = jsonResponse['\$values'];
          print("BrandList: ${jsonResponse['\$values']}");
          return brandList.map((brand) => BrandModel.fromJson(brand)).toList();
        } else if (jsonResponse.containsKey('\$id') &&
            jsonResponse.containsKey('\$values')) {
          // Alternative structure with nested $values
          List<dynamic> brandList = jsonResponse['\$values'];
          return brandList.map((brand) => BrandModel.fromJson(brand)).toList();
        } else {
          // If the structure doesn't match expected format, try to handle it as a direct array
          // if (jsonResponse is List) {
          //   return jsonResponse.map((brand) => BrandModel.fromJson(brand)).toList();
          // }
          throw Exception('Unexpected JSON structure: ${response.body}');
        }
      } else {
        throw Exception('Failed to load brands: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<BrandModel>> fetchBrandByCategory(String categoryId) async {
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}api/Brand/ByCategory?$categoryId="),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => BrandModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load brands: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
