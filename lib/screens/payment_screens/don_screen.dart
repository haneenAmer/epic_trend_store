import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/navigation_bar.dart';

class DonePayment extends StatefulWidget {
  const DonePayment({super.key});

  @override
  State<DonePayment> createState() => _DonePaymentState();
}

class _DonePaymentState extends State<DonePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child:   Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/doneavatar.png',
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 1.5,
              ),
             
              Text(
                'تمت عملية الشرا',
                style: headerTextStyle,
              ),
              Text(
                'gemd شكرا لك على  التسوق من منتجاتنا',
                style: smallTextStyle(Colors.black),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  primary:  Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NavBar()));
                },
                child: Text(
                  'الرجوع للصفحة الرئيسية',
                  style: headerTextStyleWhite,
                ),
              )
            ],
          ),
        ),
),
    );
  }
}