import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/app_colors.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/generated/l10n.dart';
import 'package:shahadmartapplication/screens/categories/main_sections/bags_section_screen.dart';
import 'package:shahadmartapplication/screens/categories/main_sections/perfumes_section_screen.dart';
import 'package:shahadmartapplication/screens/categories/main_sections/shoes_section_screen.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> backgroundImagesList = [
    'assets/images/background1.jpg',
    'assets/images/background2.jpg',
    'assets/images/background3.jpg',
  ];

  final List<String> contentImagesList = [
    'assets/images/shoes1.png',
    'assets/images/bag1.png',
    'assets/images/bag1.png',
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> categoriesSectionsNames = [
      S.of(context).bags_section,
      S.of(context).shoes_section,
      S.of(context).perfums_section,
    ];
    final List<String> Categoirieshint = [
      S.of(context).bags,
      S.of(context).shoes,
      S.of(context).perfumes,
    ];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: applicationAppBarWithoutArrowBack(context),
      body: ListView.builder(
        itemCount: backgroundImagesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: screenWidth / 3,
              height: screenHeight / 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(
                    backgroundImagesList[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(contentImagesList[index]),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          categoriesSectionsNames[index],
                          style: headerTextStyle,
                        ),
                        Text(
                          '${S.of(context).categories_sections_body}${Categoirieshint[index]}',
                          style: smallTextStyle(Colors.black),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                              height: 30,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: AppColors.mainBlack,
                              ),
                              child: pressHereButtonCategories(context, index)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

GestureDetector pressHereButtonCategories(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      // Navigate to different screens based on the index
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoesSectionScreen()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BagsSectionScreen()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PerfumesSectionscreen()),
          );
          break;
        default:
          break;
      }
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'اضغط هنا',
          style: smallTextStyle(Colors.white),
        ),
        const Icon(
          Icons.arrow_forward,
          color: AppColors.mainWhite,
        )
      ],
    ),
  );
}
