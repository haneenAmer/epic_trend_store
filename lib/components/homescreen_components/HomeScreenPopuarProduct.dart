import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shahadmartapplication/constants/app_colors.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';


class homeScreenPopuarProduct extends StatefulWidget {
  @override
  _homeScreenPopuarProductState createState() =>
      _homeScreenPopuarProductState();
}

class _homeScreenPopuarProductState extends State<homeScreenPopuarProduct> {
  List<String> imagesForSideShow = [
    'assets/images/shoes1.png',
    'assets/images/perfume1.png',
    'assets/images/bag1.png',
  ];
  List<String> correspondingTexts = [
    'High Heels',
    'Perfume',
    'Bag',
  ];
  List<int> moneyList = [
    192,
    124,
    45,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 0.4), // position of shadow
          ),
        ],
      ),
      height: 320,
      width: 350,
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          ImageSlideshow(
            indicatorColor: AppColors.mainBlack,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              for (int i = 0; i < imagesForSideShow.length; i++)
                Image.asset(imagesForSideShow[i]),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // name of product and rating widget
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      correspondingTexts[currentIndex],
                      style: smallTextStyle(Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    raitingWidget()
                  ],
                ),
                // price of product
                Text("${moneyList[currentIndex]} \$", style: headerTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
