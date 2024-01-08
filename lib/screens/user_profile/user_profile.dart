import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/end_points.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/core/model/user__information_model.dart';
import 'package:shahadmartapplication/core/services/login_services.dart';
import 'package:shahadmartapplication/core/services/user_information_services.dart';
import 'package:shahadmartapplication/screens/Login_screen.dart';
import 'package:shahadmartapplication/screens/navigation_bar.dart';
import 'package:shahadmartapplication/screens/user_profile/edite_user_profile.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  //1- declare UserInformation object
   UserInformation? _userInformation;
  bool isLoading = true;
  
//2- create initState() method and call _loadUserInformation() method inside it
  @override
  void initState() {
    super.initState();
    _loadUserInformation();
  }

//3- create _loadUserInformation() method
  Future<void> _loadUserInformation() async {
    try {
      //4- get token from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

//5- if token is not null, call getUserInformation() method and assign the result to _userInformation object
      if (token != null) {
        UserInformation userInformation =
            await UserInformationService().getUserInformation();
        setState(() {
          _userInformation = userInformation;
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error loading user information: $error');
      isLoading = false;
      throw Exception('Error loading user information');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            _userInformation != null?
             Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/profilebg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NavBar(),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              _userInformation != null
                                  ? _userInformation?.data.fullname ?? 'N/A'
                                  : ' تسجيل الدخول لعرض المعلومات',
                              style: headerTextStyle,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () async {
                            
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            String? token = prefs.getString('token');

                            if (token != null) {
                               
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                       EditeUserProfileScreen(
        
                                      ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            _userInformation != null
                                ? 'تعديل المعلومات الشخصية'
                                : 'تسجيل الدخول',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontFamily: 'Cairo',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        _userInformation?.data.phoneNumber != null
                            ? userInfoWidgetwithData(
                                Icons.phone_android_outlined,
                                'رقم الهاتف',
                                _userInformation?.data.phoneNumber ?? 'N/A',
                              )
                            : userInfoWidgetwithOutData(
                                Icons.phone_android_outlined,
                                'رقم الهاتف',
                              ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        userInfoWidgetwithData(
                          Icons.email_outlined,
                          'الايميل',
                          ' تسجيل الدخول لاضافة الايميل',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        _userInformation != null
                            ? userInfoWidgetwithData(
                                Icons.home_outlined,
                                'العنوان',
                                _userInformation?.data.country ?? 'N/A',
                              )
                            : userInfoWidgetwithOutData(
                                Icons.home_outlined,
                                'العنوان',
                              ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        userInfoWidgetwithData(
                          Icons.payment_outlined,
                          'طريقة الدفع',
                          'اضافة طريقة دفع',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        _userInformation != null
                            ? userInfoWidgetwithData(
                                Icons.location_on_outlined,
                                'المدينة',
                                _userInformation?.data.government ?? 'N/A',
                              )
                            : userInfoWidgetwithOutData(
                                Icons.location_on_outlined,
                                'المدينة',
                              ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            if (_userInformation != null) {
                              LoginServices loginServices =
                                  LoginServices(Endpoints.baseUrl);
                              await loginServices.logout();

                              // Set _userInformation to null and isLoading to false after logout
                              setState(() {
                                _userInformation = null;
                                isLoading = false;
                               
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavBar(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            _userInformation != null ? 'تسجيل الخروج' : '',
                            style: smallTextStyle(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ):const LoginScreen()
              );
  
  
  }
}
