import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';

Container filterSection(context) {
  return Container(
    width: 80,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xffE6E5E1),
      border:
          Border.all(color: const Color.fromRGBO(0, 151, 253, 0.76), width: 2),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('فلتر', style: smallTextStyle(Colors.black),),
        const FaIcon(
          FontAwesomeIcons.sliders,
          color: Colors.black,
          size: 20,
        ),
      ],
    ),
  );
}
