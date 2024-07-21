// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:sharries_signature/models/api_model.dart';

// class ProductServices {
//   final String apiUrl;
//   final String apiKey;
//   final String organizationId;
//   final String appId;

//   ProductServices({
//     required this.apiUrl,
//     required this.apiKey,
//     required this.organizationId,
//     required this.appId,
//   });

//   Future<Api> getProducts({
//     int page = 1,
//     int size = 10,
//   }) async {
//     final queryParams = {
//       'organization_id': organizationId,
//       'Appid': appId,
//       'Apikey': apiKey,
//       'page': page.toString(),
//       'size': size.toString(),
//     };

//     final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

//     final response = await http.get(uri);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return Api.fromJson(data);
//     } else {
//       throw Exception('Failed to retrieve products');
//     }
//   }

//   Future<Api> getProductsByCategory(String category, {
//     int page = 1,
//     int size = 10,
//   }) async {
//     final queryParams = {
//       'organization_id': organizationId,
//       'Appid': appId,
//       'Apikey': apiKey,
//       'category': category,
//       'page': page.toString(),
//       'size': size.toString(),
//     };

//     final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

//     final response = await http.get(uri);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return Api.fromJson(data);
//     } else {
//       throw Exception('Failed to retrieve products by category');
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sharries_signature/models/api_model.dart';
import 'package:sharries_signature/models/product_model.dart';


class ProductServices {
  final String apiUrl;
  final String apiKey;
  final String organizationId;
  final String appId;

  ProductServices({
    required this.apiUrl,
    required this.apiKey,
    required this.organizationId,
    required this.appId,
  });

  Future<Api> getProducts({
    int page = 1,
    int size = 10,
  }) async {
    final queryParams = {
      'organization_id': organizationId,
      'Appid': appId,
      'Apikey': apiKey,
      'page': page.toString(),
      'size': size.toString(),
    };

    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Api.fromJson(data);
    } else {
      throw Exception('Failed to retrieve products');
    }
  }

  Future<List<Product>> getProductsByCategory(String category, {
    int page = 1,
    int size = 10,
  }) async {
    final queryParams = {
      'organization_id': organizationId,
      'Appid': appId,
      'Apikey': apiKey,
      'page': page.toString(),
      'size': size.toString(),
      'category': category,
    };

    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Api api = Api.fromJson(data);

      return api.items;
    } else {
      throw Exception('Failed to retrieve products by category');
    }
  }
}