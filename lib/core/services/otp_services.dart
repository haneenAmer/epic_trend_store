import 'package:dio/dio.dart';
import 'package:shahadmartapplication/constants/end_points.dart';


Dio _dio = Dio();
Future<void> getOtpFromBackend(String phoneNumber) async {
  try {
    final otpResponse = await _dio.post(
      '${Endpoints.baseUrl}/auth/resend-otp/$phoneNumber',
      data: {
        'phoneNumber': phoneNumber,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );

    print('OTP sent successfully!');
     print('OTP Response data: $otpResponse');
  } catch (error) {
    // Handle errors during OTP sending
    print('Error sending OTP: $error');
  }
}
//// ui section

