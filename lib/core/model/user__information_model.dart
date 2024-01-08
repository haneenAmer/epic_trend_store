// To parse this JSON data, do
//
//     final userInformation = userInformationFromJson(jsonString);

import 'dart:convert';

UserInformation userInformationFromJson(String str) => UserInformation.fromJson(json.decode(str));

String userInformationToJson(UserInformation data) => json.encode(data.toJson());

class UserInformation {
    final int status;
    final Data data;
    final String message;
    final bool success;

    UserInformation({
        required this.status,
        required this.data,
        required this.message,
        required this.success,
    });

    factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
        "success": success,
    };
}

class Data {
    final String fullname;
    final String phoneNumber;
    final String role;
    final String government;
    final String country;

    Data({
        required this.fullname,
        required this.phoneNumber,
        required this.role,
        required this.government,
        required this.country,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullname: json["fullname"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        government: json["government"]??'اضافة مدينتك',
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "phoneNumber": phoneNumber,
        "role": role,
        "government": government,
        "country": country,
    };
}
