import 'package:flutter/material.dart';

import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

SizedBox similarProductCard(context) {
  List<int> moneyList = [
    192,
    124,
    45,
  ];
  List<String> imagesForSideShow = [
    'assets/images/shoes1.png',
    'assets/images/perfume1.png',
    'assets/images/bag1.png',
  ];
  return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagesForSideShow.length,
            itemBuilder: (BuildContext context, int i) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(
                      8,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffF0EEED),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120,
                        width: 130,
                        child: Image.asset(
                          imagesForSideShow[i],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text('اسم المنتج', style: smallTextStyle(Colors.black),),
                      raitingWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('\$ ${moneyList[i]}', style: smallTextStyle(Colors.black),),
                    ],
                  ),
                ],
              );
            }),
      ));
}
