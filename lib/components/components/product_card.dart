// import 'package:flutter/material.dart';
// import 'package:shahadmartapplication/constants/font_sizes.dart';
// import 'package:shahadmartapplication/widgets/widgets.dart';

// Container productCard (int i,List<String> imagesList,
// List <String> productTitle,List <int> productPrice,){
  
//   return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 3,
//             blurRadius: 7,
//             offset: const Offset(0, 0.4), // position of shadow
//           ),
//         ],
//       ),
//       height: 320,
//       width: 350,
//       alignment: AlignmentDirectional.center,
//       child: Column(
//         children: [

//           Image.asset(imagesList[i]),
//           const SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // name of product and rating widget
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       productTitle[i],
//                       style:SmallTextStyleWithgreyColor,
//                     ),
//                     const SizedBox(height: 5),
//                     raitingWidget()
//                   ],
//                 ),
//                 // price of product
//                 Text(
//                  "${ productPrice[i]} \$",
//                   style: HeaderTextStyle
                  
//                 ),
          
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
// }