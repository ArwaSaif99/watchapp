import 'package:arwa_s_application1/models/brand_model.dart';
import 'package:arwa_s_application1/models/watch_models.dart';
import 'package:arwa_s_application1/repository/watche_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchModelsProvider = FutureProvider<List<WatchModels>>((ref) async {
  final wactchRepository = WactchRepository();
  final models = await wactchRepository.fetchWatchModels();
  return models;
});
final searchWatchModelsProvider = StateProvider<String>((ref) => '');
