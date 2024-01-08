import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/end_points.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/signin_screen.dart';
import 'package:shahadmartapplication/screens/user_profile/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  String? phoneNumber = '';
  String? password = '';
  late Dio _dio;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
  }

  Future<void> _login() async {
    try {
      final response = await _dio.post(
        '${Endpoints.baseUrl}/api/v1/auth/signin',
        data: {
          'phoneNumber': phoneNumber,
          'password': password,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Login successful

        print('Login successful!');
        // Save the token using SharedPreferences
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('token')) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String token = response.data['token'];
          print('Token to be saved: $token');
          // store the token in the shared preferences in
          await prefs.setString('token', token);
          print('Token saved successfully! $prefs');
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserProfileScreen()));
        } else {
          print('Token not found in response data.');
          // Handle the absence of a token as per your requirements.
        }
      } else {
        // Login failed
        // Handle the error (show error message, etc.)
        print('Login failed. Status code: ${response.statusCode}');
        // Optionally, you can update the state to show an error message on the UI
        setState(() {
          // Assuming you have a String variable for storing error state
          loginError = 'Login failed. Please try again.';
        });
      }
    } catch (error) {
      // Handle Dio errors  (network issues, timeouts, etc.)
      print('Error during login: $error');
      // Optionally, you can update the state to show an error message on the UI
      setState(() {
        // Assuming you have a String variable for storing error state
        loginError = 'Login failed. Please try again.';
      });
    }
  }

  String? loginError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage("assets/images/loginbg.png"),
                //   fit: BoxFit.cover,
                // ),
                ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4.2,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/bg.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'من فضلك قم بتسجيل الدخول ',
                            style: smallTextStyle(Colors.black),
                          ),
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
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  setState(() {
                                    phoneNumber = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == '') {
                                    return 'Please enter username';
                                  }
                                },
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  hintText: 'رقم الهاتف',
                                  hintStyle: smallTextStyle(Colors.grey),
                                  suffixIcon: const Icon(Icons.phone),
                                  errorStyle: const TextStyle(fontSize: 16.0),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //----- password textfield section
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
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == '') {
                                    return 'Please enter username';
                                  }
                                },
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  hintText: 'كلمة السر ',
                                  hintStyle: smallTextStyle(Colors.grey),
                                  suffixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  errorStyle: const TextStyle(fontSize: 18.0),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'هل نسيت كلمة السر ؟',
                            style: smallTextStyle(Colors.grey),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: _login,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('تسجيل الدخول',
                                          style: headerTextStyle),
                                      const SizedBox(width: 12),
                                      Container(
                                        width: 60,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (loginError != null)
                            Text(
                              loginError!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SigninScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'انشاء حساب ',
                                  style: smallTextStyle(Colors.blue),
                                ),
                              ),
                              Text(
                                'ليس لديك حساب ؟',
                                style: smallTextStyle(Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
