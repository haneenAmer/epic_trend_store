import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/generated/l10n.dart';

class HomeScreenGifSection extends StatefulWidget {
  const HomeScreenGifSection({Key? key}) : super(key: key);

  @override
  _HomeScreenGifSectionState createState() => _HomeScreenGifSectionState();
}

class _HomeScreenGifSectionState extends State<HomeScreenGifSection>
    with TickerProviderStateMixin<HomeScreenGifSection> {
  // late FlutterGifController controller;
  final int totalFrames = 30;

  @override
  // void initState() {
  //   super.initState();
  // controller = FlutterGifController(vsync: this);
  // controller.repeat(min: 0, max: 700, period: const Duration(milliseconds: 2000));
  //}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 500,
          width: double.infinity,                                                   
          child: Image.asset(
            'assets/images/homepage.png',
            fit: BoxFit.cover,
          ),
        ),
        // تصفح افضل العروض

        Positioned(
            right: 30,
            bottom: 60,
            child: Text(
             S.of(context).brows,
              style: blackTextStyleForHome,
            )),

        Positioned(
          right: 20,
          bottom: 20,
          child:
              Text(S.of(context).best_offers, style: headerTextStyleWhiteWithUniqueFont),
        )
      ],
    );
  }

  // @override
  // void dispose() {
  //   controller
  //       .dispose(); // Dispose the controller when the widget is removed from the tree.
  //   super.dispose();
}
//}
