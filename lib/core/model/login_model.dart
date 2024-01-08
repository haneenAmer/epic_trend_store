import 'dart:convert';

class LoginModel {
    final String phoneNumber;
    final String password;
    final String deviceId;

    LoginModel({
        required this.phoneNumber,
        required this.password,
        required this.deviceId,
    });

    factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        phoneNumber: json["phone_number"],
        password: json["password"],
        deviceId: json["device_id"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "password": password,
        "device_id": deviceId,
    };
}
