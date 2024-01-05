import 'dart:convert';

import 'package:arwa_s_application1/models/brand_model.dart';
import 'package:arwa_s_application1/models/watch_model.dart';
import 'package:arwa_s_application1/models/watch_models.dart';
import 'package:arwa_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WactchRepository {
  //final url = Uri.parse('$apiUrl/get-watches');

  Future<void> getWatches(String accessToken) async {
    final url = Uri.parse("https://watchhubuae.com/api/v1/get-watches");

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'en',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      if (data['status'] == true) {
        EasyLoading.showSuccess(data['error_text']);
      } else {
        EasyLoading.showError(data['error_text']);
      }
    } else {
      print('Failed');
      throw Exception('Failed to register');
    }
  }

  Future<void> showWatch(String accessToken, String watchId) async {
    final url = Uri.parse("https://watchhubuae.com/api/v1/show-watch/$watchId");

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'en',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  Future<void> addWatch(Watch watch, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://watchhubuae.com/api/v1/add-watch");
    print(prefs.getString('token'));

    try {
      Map<String, dynamic> watchData = watch.toJson();
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          'Authorization': 'Bearer ${prefs.getString('token') ?? ''}',
        },
        body: watchData,
      );
      print('fffffffffffffffffffffffffffffffffffffffffffffffffffff');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print(data);
        if (data['status'] == true) {
          EasyLoading.showSuccess(data['error_text']);

          Navigator.pushNamed(context, AppRoutes.homePage);
        } else {
          EasyLoading.showError(data['error_text']);
        }
      } else {
        print('Failed');
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to register');
      }
    } catch (e) {
      print('Error converting to JSON: $e');
    }
  }

  Future<void> updateWatch(String accessToken, String watchId,
      Map<String, dynamic> updateData) async {
    final url =
        Uri.parse("https://watchhubuae.com/api/v1/update-watch/$watchId");

    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': 'Bearer $accessToken',
      },
      body: updateData,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  Future<List<Brand>> getBrands() async {
    final url = Uri.parse("https://watchhubuae.com/api/v1/brands");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> brandData = data['data']['brands'];

      final List<Brand> brands =
          brandData.map((brand) => Brand.fromJson(brand)).toList();

      return brands;
    } else {
      throw Exception('Failed to load brands');
    }
  }

  Future<List<WatchModels>> fetchWatchModels() async {
    final response = await http
        .get(Uri.parse('https://watchhubuae.com/api/v1/watch-models'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          json.decode(response.body)['data']['watch model'];

      return jsonData
          .map((modelData) => WatchModels.fromJson(modelData))
          .toList();
    } else {
      throw Exception('Failed to load watch models');
    }
  }
}
