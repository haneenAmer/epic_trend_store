import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadmartapplication/constants/end_points.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:dio/dio.dart';
import 'package:shahadmartapplication/core/services/otp_services.dart';
import 'package:shahadmartapplication/screens/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final nameControllerProvider =
      Provider<TextEditingController>((ref) => TextEditingController());
  final phoneNumberControllerProvider =
      Provider<TextEditingController>((ref) => TextEditingController());
  final passwordControllerProvider =
      Provider<TextEditingController>((ref) => TextEditingController());
  final confirmPasswordControllerProvider =
      Provider<TextEditingController>((ref) => TextEditingController());

  final Dio _dio = Dio();

  Future<void> _registerUser() async {
    final String name = _nameController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

// Check if name is empty
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'يجب ملء حقل الاسم',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.red,
              fontFamily: 'Cairo',
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    // Check if phone number is empty
    if (phoneNumber.isEmpty || phoneNumber.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'تحقق من رقم الهاتف',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 18.0, color: Colors.red, fontFamily: 'Cairo'),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }

    // Check if passwords match
    if (password != confirmPassword) {
      // Passwords do not match
      // Show error message in the TextFormField
      _confirmPasswordController
          .clear(); // Clear the incorrect confirmation password
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'كلمة السر غير متطابقة يرجى المحاولة مرة أخرى',
            textAlign: TextAlign.end,
            style:
                TextStyle(color: Colors.red, fontFamily: 'Cairo', fontSize: 16),
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (password.length <= 8 && confirmPassword.length <= 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'كلمة السر يجب ان تكون اكثر من 8 احرف',
            textAlign: TextAlign.end,
            style:
                TextStyle(color: Colors.red, fontFamily: 'Cairo', fontSize: 16),
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
//
    try {
      final response =
          await _dio.post('${Endpoints.baseUrl}/api/v1/auth/signup',
              data: {
                'fullname': name,
                'phoneNumber': phoneNumber,
                'password': password,
                'confirmPassword': confirmPassword,
              },
              options: Options(
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json; charset=UTF-8',
                },
              ));
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 201) {
        // User registration successful

        print('User registered successfully!');

        // send the phone number to the backend to recieve the OTP

        getOtpFromBackend(phoneNumber);

// Navigate to the OTP screen
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SendOtpToBackendScreen(
                      phoneNumber: phoneNumber,
                    )));

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
      } else {
        print('User registration failed. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle Dio errors (network issues, timeouts, etc.)
      print('Error during registration: $error');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'An error occurred during registration. Please try again later.',
            textAlign: TextAlign.end,
            style:
                TextStyle(color: Colors.red, fontFamily: 'Cairo', fontSize: 16),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  bool isPasswordVisible = true;
  bool isconfirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/loginbg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  /// logog image section
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4.2,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/bg.png',
                              )),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'انشاء حساب',
                    style: smallTextStyle(Colors.black),
                  ),
                  // name section
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          hintText: 'الاسم',
                          hintStyle: smallTextStyle(Colors.grey),
                          suffixIcon: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                        ),
                      ),
                    ),
                  ),
                  // phone number section
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          hintText: 'رقم الهاتف',
                          hintStyle: smallTextStyle(Colors.grey),
                          suffixIcon: const Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                        ),
                      ),
                    ),
                  ),
                  // password
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: isPasswordVisible,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                  print(isPasswordVisible);
                                });
                              },
                              child: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              )),
                          hintText: 'كلمة السر',
                          hintStyle: smallTextStyle(Colors.grey),
                          suffixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                        ),
                      ),
                    ),
                  ),
                  // password confirmation
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: isconfirmPasswordVisible,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          hintText: ' تأكيد كلمة السر ',
                          hintStyle: smallTextStyle(Colors.grey),
                          suffixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          prefixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isconfirmPasswordVisible =
                                      !isconfirmPasswordVisible;
                                  print(isconfirmPasswordVisible);
                                });
                              },
                              child: Icon(
                                isconfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              )),
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // create account button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'تراجع',
                                  style: smallTextStyle(Colors.black),
                                )),
                            GestureDetector(
                              onTap: _registerUser,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('انشاء حساب ', style: headerTextStyle),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    width: 60,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: Image.asset('assets/images/shah.png'))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
