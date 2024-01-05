import 'dart:convert';

import 'package:arwa_s_application1/models/user_model.dart';
import 'package:arwa_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final String baseUrl;

  UserRepository(this.baseUrl);

  Future<UserModel> loginUser(String email, String password, String fcmToken,
      BuildContext context) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'provider': 'email',
        'email': email,
        'password': password,
        'fcm_token': fcmToken,
      },
    );

    if (response.statusCode == 200) {
      SharedPreferences.setMockInitialValues({});

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      if (data['status'] == true) {
        EasyLoading.showSuccess(data['error_text']);
        prefs.setString('token', data['data']['token']);
        Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
      } else {
        EasyLoading.showError(data['error_text']);
      }
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String profileImage,
    required String fcmToken,
    required BuildContext context,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/UsersRegister'),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
      },
      body: {
        'provider': 'phone',
        'name': name,
        'email': email,
        'mobile': '9715634847',
        'password': password,
        'confirm_password': confirmPassword,
        'profile_image': profileImage,
        'fcm_token': fcmToken,
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
      return UserModel.fromJson(data);
    } else {
      print('Failed');
      throw Exception('Failed to register');
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    final response = await http.post(
      Uri.parse('$baseUrl/password/forget'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'provider': 'email',
        'email': email,
        'mobile': '',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == true) {
        EasyLoading.showSuccess(data['error_text']);
        Navigator.pushNamed(
          context,
          AppRoutes.forgotPasswordTwoScreen,
          arguments: {'email': email},
        );
      } else {
        EasyLoading.showError(data['error_text']);
      }
    }

    if (response.statusCode != 200) {
      EasyLoading.showError('Failed to reset password');

      throw Exception('Failed to reset password');
    }
  }

  Future<void> verifyCode(
      String verificationCode, email, BuildContext context) async {
    final response = await http.post(
      Uri.parse('$baseUrl/check-verification-code'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'provider': 'email',
        'email': email,
        'mobile': '',
        'forget_code': verificationCode,
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == true) {
        EasyLoading.showSuccess(data['error_text']);
        Navigator.pushNamed(
          context,
          AppRoutes.forgotPasswordScreen,
          arguments: {'email': email, 'code': verificationCode},
        );
      } else {
        EasyLoading.showError(data['error_text']);
      }
    }

    if (response.statusCode != 200) {
      EasyLoading.showError('Failed to reset password');

      throw Exception('Failed to reset password');
    }
  }

  Future<void> resendCode(email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/resend-otp'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'provider': 'email',
        'email': email,
        'mobile': '',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == true) {
        EasyLoading.showSuccess(data['error_text']);
        //  Navigator.pushNamed(context, AppRoutes.forgotPasswordTwoScreen);
      } else {
        EasyLoading.showError(data['error_text']);
      }
    }

    if (response.statusCode != 200) {
      EasyLoading.showError('Failed to reset password');

      throw Exception('Failed to reset password');
    }
  }

  Future<void> resetPasswordA(String email, String forgetCode, String password,
      String confirmPassword) async {
    final url =
        '$baseUrl/password/reset'; // Replace {{url}} with the actual base URL

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{},
        body: <String, dynamic>{
          'provider': 'email',
          'email': email,
          'forget_code': forgetCode,
          'password': password,
          'confirm_password': confirmPassword,
        },
      );
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      // Check the response status
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == true) {
          EasyLoading.showSuccess(data['error_text']);
          //  Navigator.pushNamed(context, AppRoutes.forgotPasswordTwoScreen);
        } else {
          EasyLoading.showError(data['error_text']);
        }
      }

      if (response.statusCode != 200) {
        EasyLoading.showError('Failed to reset password');

        throw Exception('Failed to reset password');
      }
    } catch (e) {
      // An error occurred during the request
      print('Error during password reset request: $e');
    }
  }

  onTapSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }

  Future<void> loginBySocial(
    String firstName,
    String lastName,
    String email,
    String socialImage,
    String provider,
    String socialToken,
    String fcmToken,
    String deviceType,
  ) async {
    try {
      final url = Uri.parse(
          'https://watchhubuae.com/api/v1/loginBySocial'); // Replace with your actual URL

      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'en',
        },
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'social_img': socialImage,
          'provider': provider,
          'social_token': socialToken,
          'fcm_token': fcmToken,
          'device_type': deviceType,
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Login by social successful');
        print(response.body);
      } else {
        // Handle error
        print('Error during login by social: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      // Handle exceptions
      print('Exception during login by social: $error');
    }
  }

  Future<List<UserModel>> fetchUserProfile() async {
    final apiUrl = 'https://watchhubuae.com/api/v1/profile';
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Accept-Language': 'ar',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate, br',
          'Authorization': 'Bearer ${prefs.getString('token') ?? ''}',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == true) {
          final userJson = responseData['data']['user'];

          // Ensure userJson is a list (even if it's a single user)
          final userList = (userJson is List) ? userJson : [userJson];

          // Convert the dynamic data into a List<UserModel>
          List<UserModel> users =
              userList.map((userJson) => UserModel.fromJson(userJson)).toList();

          return users;
        } else {
          throw Exception(
              'Failed to fetch user profile: ${responseData['error_text']}');
        }
      } else {
        throw Exception('Failed to fetch user profile: ${response.body}');
      }
    } catch (error) {
      throw Exception('Failed to fetch user profile: $error');
    }
  }

  Future<List<UserModel>> editProfile() async {
    final apiUrl = 'https://watchhubuae.com/api/v1/profile/edit';
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Accept-Language': 'ar',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate, br',
          'Authorization': 'Bearer ${prefs.getString('token') ?? ''}',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == true) {
          final userJson = responseData['data']['user'];

          // Ensure userJson is a list (even if it's a single user)
          final userList = (userJson is List) ? userJson : [userJson];

          // Convert the dynamic data into a List<UserModel>
          List<UserModel> users =
              userList.map((userJson) => UserModel.fromJson(userJson)).toList();

          return users;
        } else {
          throw Exception(
              'Failed to fetch user profile: ${responseData['error_text']}');
        }
      } else {
        throw Exception('Failed to fetch user profile: ${response.body}');
      }
    } catch (error) {
      throw Exception('Failed to fetch user profile: $error');
    }
  }
}
