import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahadmartapplication/constants/app_colors.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/language/language_popup.dart';
import 'package:shahadmartapplication/screens/cart/cart_screen_without_data.dart';

/// remove blue light
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

// raiting stars
RatingBar raitingWidget() {
  return RatingBar.builder(
    itemSize: 20,
    initialRating: 1,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
    itemBuilder: (context, _) => const Icon(
      Icons.star_rounded,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      print(rating);
    },
  );
}

// app bar

AppBar applicationAppBar(context) {
  return AppBar(
    scrolledUnderElevation: 0,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColors.mainBlack),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreenWithoutData(),
              ),
            );
          },
          child: SvgPicture.asset(
            'assets/icons/Cart.svg',
            width: 25,
            height: 25,
          ),
        ),
      ),
    ],
  );
}

// appbar without arrowback

AppBar applicationAppBarWithoutArrowBack(context) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.mainWhite,
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreenWithoutData(),
              ),
            );
          },
          child: SvgPicture.asset(
            'assets/icons/Cart.svg',
            width: 25,
            height: 25,
          ),
        ),
      ),
    ],
  );
}

// appbar without arrowback

AppBar appBarOfSettings(context) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.mainWhite,
     automaticallyImplyLeading: false,
    actions: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: LanguagePopUp(),
      )
    ],

  );
}

// a widget to show the user information
Row userInfoWidgetwithData(IconData icon, String headerText, String hintText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            headerText,
            style: smallTextStyle(Colors.black),
          ),
          const SizedBox(height: 5),
          Text(
            hintText,
            style: smallTextStyle(Colors.grey),
          ),
        ],
      ),
      const SizedBox(width: 10),
      Icon(
        icon,
        color: Colors.grey,
      ),
    ],
  );
}


Row userInfoWidgetwithOutData(IconData icon, String headerText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical:12.0),
        child: Text(
          headerText,
          style: smallTextStyle(Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    
      const SizedBox(width: 10),
      Icon(
        icon,
        color: Colors.grey,
      ),
    ],
  );
}


// a widget to edite the user information
Padding editeUserInfoWidget(
    IconData icon, String hintText, TextEditingController textController) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: TextField(
        controller: textController,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintStyle: smallTextStyle(Colors.grey),
          prefix: const Icon(
            Icons.edit_outlined,
            color: Colors.grey,
          ),
        ),
      ));
}

// a widget to a manual payment


Padding manualPaymentWidget(
  final TextInputType keyboardType,
  final String nullReturn,
  final String hintText,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return nullReturn;
          }
          return null; // Return null for no validation error
        },
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          hintText: hintText,
          
          errorStyle: const TextStyle(fontSize: 16.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
        
          hintStyle: smallTextStyle(Colors.grey),
        ),
      ),
    ),
  );
}


// dvider widget

Divider dividerWidget() {
  return const Divider(
    color: Color(0xffEBF0FF),
    height: 20,
    thickness: 1,
    indent: 20,
    endIndent: 20,
  );
}
