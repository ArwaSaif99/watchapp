import 'package:arwa_s_application1/models/user_model.dart';
import 'package:arwa_s_application1/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider<List<UserModel>>((ref) async {
  final userRepository = UserRepository('https://watchhubuae.com/api/v1');
  final profile = await userRepository.fetchUserProfile();
  return profile;
});
final searchUserProvider = StateProvider<String>((ref) => '');
