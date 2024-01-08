import 'package:flutter/material.dart';
import 'package:shahadmartapplication/components/components/footer.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/components/components/similar_card.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> smallImages = [
    'assets/images/sportshoes.png',
    'assets/images/shoes1.png',
    'assets/images/bag1.png',
  ];
  List<int> sizesList = [36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46];

  int selectedImageIndex = 0;
  List<Color> colors = [Colors.red, Colors.green, Colors.blue];
  int selectedIndex = -1;
  int selectedIndexForSizes = -1;

  int itemCount = 1; // Initial item count

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double marginValue = 16;

    return Scaffold(
      appBar: applicationAppBar(context),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: marginValue * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // main container
                        Container(
                          height: screenHeight / 3,
                          margin: EdgeInsets.symmetric(vertical: marginValue),
                          width: screenWidth - marginValue,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xffEDEDED),
                          ),
                          child: Image.asset(smallImages[
                              selectedImageIndex]), // Display the selected image
                        ),
                        // small containers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < smallImages.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedImageIndex =
                                        i; // Update selected image index on tap
                                  });
                                },
                                child: Container(
                                  width: screenWidth / 4.5,
                                  height: 100,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: marginValue / 1.5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEDEDED),
                                    borderRadius: BorderRadius.circular(12),
                                    border: selectedImageIndex == i
                                        ? Border.all(color: Colors.black)
                                        : Border.all(color: Colors.transparent),
                                  ),
                                  child: Image.asset(
                                    smallImages[i],
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        // product details ( title , price , description , color , size , )
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        // ----- name section
                        Text(
                          'اسم المنتج',
                          style: headerTextStyle,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Text(
                          ' \$ 345',
                          style: headerTextStyle,
                        ),

                        // ----- description section
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Text(
                          'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة',
                          style: smallTextStyle(Colors.black),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),

                        // ----- color section

                        Text(
                          'اللون',
                          style: headerTextStyle,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            colors.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: marginValue / 2),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors[index],
                                ),
                                child: selectedIndex == index
                                    ? const Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),

                        // ----- size section

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Text(
                          'اختر الحجم ',
                          style: headerTextStyle,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              sizesList.length,
                              (indexsizes) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndexForSizes = indexsizes;
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: marginValue / 2),
                                      width: 80,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color:
                                            selectedIndexForSizes == indexsizes
                                                ? Colors.black
                                                : const Color(0xffF0F0F0),
                                      ),
                                      child: Center(
                                          child: Text(
                                        ' ${sizesList[indexsizes]}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: selectedIndexForSizes ==
                                                    indexsizes
                                                ? Colors.white
                                                : Colors.black),
                                      )))),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        // similar section

                        Text(
                          'منتجات مشابها لذوقك ',
                          style: headerTextStyle,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        similarProductCard(context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  footerWidget(),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
          ),

          //----- add to cart button

          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height: 70,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: marginValue * 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //---- counter section
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: marginValue / 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (itemCount > 1) {
                                        itemCount--;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    itemCount.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      itemCount++;
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                )
                              ]),
                        ),
                      ),
                      //---- add to cart button section
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 12),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Implement logic for adding the item to the cart
                        },
                        child: Text(
                          'اضافة للسلة',
                          style: smallTextStyle(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
