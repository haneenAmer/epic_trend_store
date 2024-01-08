import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';


// TBD
class homeSreenCategoriesSectionList extends StatelessWidget {
  final List<String> backgroundImagesList = [
    'assets/images/background1.jpg',
    'assets/images/background2.jpg',
    'assets/images/background3.jpg',
  ];

  final List<String> shoesSectionsNames = [
    'احذية نسائية',
    'احذية رياضية',
    'قسم العطور',
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: applicationAppBar(context),
      body: ListView.builder(
        itemCount: backgroundImagesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: screenHeight/4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(backgroundImagesList[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  shoesSectionsNames[index],
                  style: headerTextStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
