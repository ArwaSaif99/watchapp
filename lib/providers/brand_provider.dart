import 'package:arwa_s_application1/models/brand_model.dart';
import 'package:arwa_s_application1/repository/watche_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brandProvider = FutureProvider<List<Brand>>((ref) async {
  final wactchRepository = WactchRepository();
  final brands = await wactchRepository.getBrands();
  return brands;
});
final searchBrandProvider = StateProvider<String>((ref) => '');
