import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';

import 'package:shahadmartapplication/screens/Login_screen.dart';
import 'package:shahadmartapplication/screens/cart/cart_screen_with_data.dart';
import 'package:shahadmartapplication/screens/user_profile/user_profile.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final FlutterLocalization localization = FlutterLocalization.instance;

    return Scaffold(
      appBar: appBarOfSettings(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'الاعدادات',
                style: headerTextStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

// -------- profile section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfileScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الصفحة الشخصية',
                      style: smallTextStyle(Colors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),

            //------- notification section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الاشعارات',
                      style: smallTextStyle(Colors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/notification.svg',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            //------ laonguage section

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreenWithData()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تغيير اللغة ',
                      style: smallTextStyle(Colors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/language.svg',
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            //-------- about section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const LanguagePopUp())
                  //           );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'حول',
                      style: smallTextStyle(Colors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/information.svg',
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
