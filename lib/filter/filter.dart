import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:shahadmartapplication/components/components/filter_section.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/product_details_screen.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class Product {
  final String? productsName;
  final String? productsImage;
  final int? productPrice;

  Product(
      {required this.productsName,
      required this.productsImage,
      required this.productPrice});
}

List<Product> productsList = [
  Product(
      productsName: "Jon",
      productsImage: "assets/images/shoes1.png",
      productPrice: 123),
  Product(
      productsName: "Lindsey ",
      productsImage: "assets/images/sportshoes.png",
      productPrice: 23),
  Product(
      productsName: "Valarie ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 124),
  Product(
      productsName: "Elyse ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 14),
  Product(
      productsName: "Ethel ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 14),
  Product(
      productsName: "Emelyan ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 103),
  Product(
      productsName: "Catherine ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 120),
  Product(
      productsName: "Stepanida  ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 154),
  Product(
      productsName: "Carolina ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 19),
  Product(
      productsName: "Nail  ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 190),
  Product(
      productsName: "Kamil ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 142),
  Product(
      productsName: "Mariana ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 149),
  Product(
      productsName: "Katerina ",
      productsImage: "assets/images/shoes1.png",
      productPrice: 141),
];

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<Product>? selectedUserList = [];

  void openFilterDialog() async {
    await FilterListDialog.display<Product>(
      context,
      listData: productsList,
      selectedListData: selectedUserList,
      choiceChipLabel: (user) => user!.productsName,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.productsName!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> pages = [const ProductDetails()];

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: openFilterDialog,
      //   child: const Icon(Icons.add),
      // ),
      body: selectedUserList == null || selectedUserList!.length == 0
          ? Scaffold(
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
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => const FilterWidget()));
                        },
                        child: filterSection(context)),
                    const SizedBox(height: 10),
                    // product list view
                    Expanded(
                      child: SizedBox(
                        height: screenHeight,
                        child: ListView.builder(
                          itemCount: productsList.length,
                          itemBuilder: (context, index) {
                            // user = productsList[index];
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
                                      Image.asset(
                                          productsList[index].productsImage ??
                                              ''),
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
                                                  selectedUserList![index]
                                                          .productsName ??
                                                      "error",
                                                  style:
                                                      smallTextStyle(Colors.grey),
                                                ),
                                                const SizedBox(height: 5),
                                                raitingWidget()
                                              ],
                                            ),
                                            // price of product
                                            Text(
                                                "${selectedUserList![index].productPrice ?? 0} \$",
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
              ))
          : ListView.builder(
              itemBuilder: (context, index) {
                Expanded(
                  child: SizedBox(
                    height: screenHeight,
                    child: ListView.builder(
                      itemCount: productsList.length,
                      itemBuilder: (context, index) {
                        //user = productsList[index];
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
                                  Image.asset(
                                      productsList![index].productsImage ?? ''),
                                  //const SizedBox(height: 0),
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
                                            //
                                            Text(
                                              selectedUserList![index]
                                                      .productsName ??
                                                  "error",
                                              style:
                                                  smallTextStyle(Colors.grey),
                                            ),
                                            const SizedBox(height: 5),
                                            raitingWidget()
                                          ],
                                        ),
                                        // price of product
                                        Text(
                                            "${selectedUserList![index].productPrice ?? 0} \$",
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
                );
              },
              itemCount: selectedUserList!.length,
            ),
    );
  }
}
