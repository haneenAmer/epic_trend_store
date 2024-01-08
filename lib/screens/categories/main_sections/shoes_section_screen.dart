import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/categories/primary_section/shoes_list.dart';
import 'package:shahadmartapplication/screens/home_screen.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class ShoesSectionScreen extends StatelessWidget {
  final List<String> backgroundImagesList = [
    'assets/images/shoessection.jpg',
    'assets/images/shoessection2.jpg',
    'assets/images/shoessection.jpg',
  ];

  final List<String> shoesSectionsNames = [
    'احذية نسائية',
    'احذية رياضية',
    'قسم العطور',
  ];

  final List<Widget> pages = [
    const ShoesListWithFilterAndSearch(),
    const HomeScreen(),
    const HomeScreen(),
  ];

   ShoesSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: applicationAppBar(context),
      body: ListView.builder(
        itemCount: backgroundImagesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to different screens based on the index
                if (index < pages.length) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pages[index]),
                  );
                }
              },
              child: Container(
                height: screenHeight / 4,
                width: screenWidth / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: AssetImage(backgroundImagesList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    shoesSectionsNames[index],
                    style: headerTextStyleWhite,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
