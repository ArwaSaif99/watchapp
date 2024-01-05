import 'package:arwa_s_application1/models/brand_model.dart';
import 'package:arwa_s_application1/models/city_model.dart';
import 'package:arwa_s_application1/repository/citites_repository.dart';
import 'package:arwa_s_application1/repository/watche_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = FutureProvider<List<CityModel>>((ref) async {
  final cityRepository = CityRepository();
  final city = await cityRepository.getCities();
  return city;
});
final searchCityProvider = StateProvider<String>((ref) => '');
