import 'dart:convert';

import 'package:arwa_s_application1/models/city_model.dart';
import 'package:http/http.dart' as http;

class CityRepository {
  Future<List<CityModel>> getCities() async {
    final url = Uri.parse("https://watchhubuae.com/api/v1/get-cities");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> cityData = data['data']['cities'];

      final List<CityModel> city =
          cityData.map((city) => CityModel.fromJson(city)).toList();

      return city;
    } else {
      throw Exception('Failed to load brands');
    }
  }
}
