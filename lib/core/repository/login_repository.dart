
import 'package:shahadmartapplication/core/model/login_model.dart';
import 'package:shahadmartapplication/core/services/login_services.dart';

class LoginRepository {
  LoginRepository();

  LoginServices loginServices = LoginServices(
    'http://192.168.68.114:8000/api/users/login',
  );

  Future<LoginModel> getLoginModel() async {
    try {
      var json = await loginServices.loginResponse(LoginModel(
        phoneNumber: '', 
        password: '', 
        deviceId: '', 
      )); // Adjust as per your LoginModel constructor
      LoginModel loginModel = LoginModel.fromJson(json);
      return loginModel;
    } catch (e) {
      // Handle the error, you can log it or rethrow if needed
      rethrow;
    }
  }
}
