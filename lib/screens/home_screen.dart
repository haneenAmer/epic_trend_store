import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahadmartapplication/components/components/footer.dart';
import 'package:shahadmartapplication/components/homescreen_components/HomeScreenDiscoverNewProducts.dart';
import 'package:shahadmartapplication/components/homescreen_components/HomeScreenGifSection.dart';
import 'package:shahadmartapplication/components/homescreen_components/HomeScreenPopuarProduct.dart';
import 'package:shahadmartapplication/components/homescreen_components/HomeScreenProductsSection.dart';
import 'package:shahadmartapplication/components/homescreen_components/HomeScreenRecentlyArrivedSection.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/generated/l10n.dart';
import 'package:shahadmartapplication/screens/cart/cart_screen_without_data.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: const Color(0xffF8C46E),
            leading: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreenWithoutData()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(
                      'assets/icons/Cart.svg',
                      color: Colors.white,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            leadingWidth: 300,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Container(
                  height: 40,
                  width: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                hintText:  S.of(context).search_for_product,
                                hintStyle: smallTextStyle(Colors.grey),
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(children: [
            Column(
              children: [
                const HomeScreenGifSection(),
                const SizedBox(
                  height: 20,
                ),
                HomeScreenProductsSection(context),
                const SizedBox(
                  height: 20,
                ),
                //HomeSreenCategoriesSectionList(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context).best_sales,
                  style: headerTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                homeScreenPopuarProduct(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context).recently_arrived,
                  style: headerTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                homeScreenRecentlyArrivedSection(),
                const SizedBox(
                  height: 20,
                ),
                homeScreenDiscoverdNewProducts(context),
                const SizedBox(
                  height: 20,
                ),
                const footerWidget(),
              ],
            )
          ]),
        ));
  }
}
