import 'package:dio/dio.dart';
import 'package:shahadmartapplication/constants/end_points.dart';
import 'package:shahadmartapplication/core/model/user__information_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformationService {
  final Dio _dio = Dio();

  Future<UserInformation> getUserInformation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print('Token: $token');
      final response = await _dio.get(
        '${Endpoints.baseUrl}/api/v1/session',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserInformation.fromJson(response.data);
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Error getting user information');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Error getting user information');
    }
  }
}
