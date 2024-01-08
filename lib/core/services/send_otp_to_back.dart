import 'package:dio/dio.dart';
import 'package:shahadmartapplication/constants/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> sendOtpToBackend(String phoneNumber, String otp) async {
  try {
    final response = await Dio().put(
      '${Endpoints.baseUrl}/auth/verify-user/$phoneNumber',
      data: {
        'code': otp,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );

    // Handle the response as needed
      // Save the token using SharedPreferences
        if (response.data.containsKey('token')) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
           String token = response.data['token'];
           print('Token to be saved: $token');
          // store the token in the shared preferences in 
         await prefs.setString('token', token);
          print('Token saved successfully! $prefs');
        } else {
          print('Token not found in response data.');
          // Handle the absence of a token as per your requirements.
        }
    print('OTP verification response: ${response.data}');
  } catch (error) {
    // Handle errors during OTP verification
    print('Error sending OTP to backend: $error');
  }
}
