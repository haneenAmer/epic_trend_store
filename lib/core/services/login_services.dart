import 'package:dio/dio.dart';
import 'package:shahadmartapplication/core/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginServices{
  final String endPoint;

LoginServices(this.endPoint);
  final Dio dio = Dio();
  /// Login user
   Future loginResponse(LoginModel loginModel) async {
    try {
      final response = await dio.post(endPoint,data: loginModel.toJson);
      print("hi ${response.data}");
      if (response.data!=null){
        return loginResponse(response.data);
      }
      else {
      // Handle the case where response.data is null
     print('Login failed. Status code: ${response.statusCode}');
    }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
 // log out user 
 Future<void> logout() async {
    try {
      // Clear the token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      print('Logout successful!');

      // Optionally, you can perform additional cleanup or actions here.

    } catch (e) {
      print('Error during logout: $e');
      rethrow;
    }
  }


}
