import 'package:dio/dio.dart';

class AuthenticationApi {
  final Dio _dio;

  AuthenticationApi(this._dio);

  Future<dynamic> registerUser({
    required String name,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'YOUR_API_ENDPOINT',
        data: {
          'name': name,
          'phone_number': phoneNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // User registration successful
        // Handle the success case
      } else {
        // User registration failed
        // Handle the error case
      }
    } catch (error) {
      // Handle network errors or other exceptions
    }
  }
}
