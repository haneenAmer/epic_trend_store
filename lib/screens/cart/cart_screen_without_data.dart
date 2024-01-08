import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/navigation_bar.dart';

class CartScreenWithoutData extends StatefulWidget {
  const CartScreenWithoutData({super.key});

  @override
  State<CartScreenWithoutData> createState() => _CartScreenWithoutDataState();
}

class _CartScreenWithoutDataState extends State<CartScreenWithoutData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'السلة',
              style: headerTextStyle,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/emptycart.png',
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              'السلة فارغة',
              style: headerTextStyle,
            ),
            Text(
              'عُد إلى الصفحة الرئيسية لشراء ما تفضلهُ من المُنتجات',
              style: smallTextStyle(Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
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
                'ابدا التسوق ',
                style: headerTextStyleWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
