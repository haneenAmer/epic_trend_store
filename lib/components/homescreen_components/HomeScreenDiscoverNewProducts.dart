import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/generated/l10n.dart';

Stack homeScreenDiscoverdNewProducts(context) {
  return Stack(children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          //width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffE6E5E1),
          ),
          alignment: AlignmentDirectional.bottomCenter,
          child: Row(
            children: [
              Image.asset('assets/images/bag1.png'),
              Column(
                children: [
                  Text(
                     S.of(context).discoverd_new_product,
                    style: headerTextStyle,
                  ),
                  Text(
                    S.of(context).buy_now,
                    style: headerTextStyle,
                  ),
                ],
              ),
            ],
          )),
    ),
    Positioned(right: 0, top: 0, child: Image.asset('assets/images/bg2.png')),
  ]);
}
