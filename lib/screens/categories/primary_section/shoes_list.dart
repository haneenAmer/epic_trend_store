import 'package:flutter/material.dart';
import 'package:shahadmartapplication/components/components/filter_section.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/filter/filter.dart';
import 'package:shahadmartapplication/screens/product_details_screen.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class ShoesListWithFilterAndSearch extends StatefulWidget {
  const ShoesListWithFilterAndSearch({super.key});

  @override
  State<ShoesListWithFilterAndSearch> createState() =>
      _ShoesListWithFilterAndSearchState();
}

class _ShoesListWithFilterAndSearchState
    extends State<ShoesListWithFilterAndSearch> {
  List<Product>? selectedUserList = [];

  @override
  Widget build(BuildContext context) {
    late Product user;
    // final List<String> shoesImagesList = [
    //   'assets/images/shoes1.png',
    //   'assets/images/shoes1.png',
    //   'assets/images/shoes1.png',
    // ];
    // List<String> correspondingTexts = [
    //   'sport shoes',
    //   'heals',
    //   'sport shoes',
    // ];
    // List<int> moneyList = [
    //   192,
    //   124,
    //   45,
    // ];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> pages = [const ProductDetails()];

    return Scaffold(
        appBar: applicationAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // search section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: 'ابحث عن منتجاتك',
                        hintStyle: smallTextStyle(Colors.black),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              // filter section
              filterSection(context),
              const SizedBox(height: 10),
              // product list view
              Expanded(
                child: SizedBox(
                  height: screenHeight,
                  child: ListView.builder(
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      user = productsList[index];
                      // product card
                      return GestureDetector(
                        onTap: () {
                          // Navigate to different screens based on the index
                          if (index < pages.length) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pages[index]),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 0.4), // position of shadow
                                ),
                              ],
                            ),
                            height: screenWidth / 1.4,
                            width: screenWidth,
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              children: [
                                // image of products
                                Container(
                                  height: 150,width: 150,
                                  child: Image.asset(user.productsImage ?? '',
                                  fit: BoxFit.contain,
                                  )),
                                const SizedBox(height: 0),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // name of product and rating widget
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user.productsName ?? "error",
                                            style: smallTextStyle(Colors.grey),
                                          ),
                                          const SizedBox(height: 5),
                                          raitingWidget()
                                        ],
                                      ),
                                      // price of product
                                      Text("${user.productPrice ?? 0} \$",
                                          style: headerTextStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
