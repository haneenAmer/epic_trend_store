import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/app_colors.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/generated/l10n.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

SizedBox homeScreenRecentlyArrivedSection() {
  List<String> imagesForSideShow = [
    'assets/images/shoes1.png',
    'assets/images/perfume1.png',
    'assets/images/bag1.png',
  ];
  return SizedBox(
      height: 230,
      width: double.infinity,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8, left: 27),
            itemCount: imagesForSideShow.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5),
                height: 400,
                width: 240,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffE6E5E1),
                  // borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120,
                        width: 130,
                        child: Image.asset(
                          imagesForSideShow[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainBlack,
                      ),
                      height: 40,
                      width: 100,
                      child: Center(
                        child: Text( S.of(context).see_product,
                            style: smallTextStyle(Colors.white),),
                      ),
                    )
                  ],
                ),
              );
            }),
      ));
}
