import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/app_colors.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/generated/l10n.dart';

// home screen first section (title , button , products : heas , man shoes , bag)
Container HomeScreenProductsSection(context) {
  return Container(
      alignment: AlignmentDirectional.bottomCenter,
      child: Column(
        children: [
          Text(
             S.of(context).products,
            style: headerTextStyle,
          ),
          Text(
            S.of(context).product_section_description,
            style: smallTextStyle(Colors.grey),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 80,
              decoration: const BoxDecoration(
                color: AppColors.mainBlack,
              ),
              child: Text(
                 S.of(context).see_product,
                textAlign: TextAlign.center,
                style: smallTextStyle(Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/heals.png',
                  ),
                  Text(
                     S.of(context).women_shoes,
                    style: smallTextStyle(Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/menshoes.png',
                  ),
                  Text(
                    S.of(context).men_shoes,
                    style:smallTextStyle(Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/pinkbag.png',
                  ),
                  Text(
                    S.of(context).bags,
                    style: smallTextStyle(Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ],
      ));
}
