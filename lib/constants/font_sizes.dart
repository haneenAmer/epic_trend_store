import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




TextStyle headerTextStyle = TextStyle(
  fontSize: 16.sp,
  fontFamily: 'Cairo',
  fontWeight: FontWeight.bold,
  color: Colors.black,
  
);

TextStyle headerTextStyleWhite = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'Cairo',
  color: Colors.white,
);
TextStyle headerTextStyleWhiteWithUniqueFont = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'NotoNastaliqUrdu-VariableFont_wght',
  shadows:const [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black,
      offset: Offset(5.0, 5.0),
    ),
  ],
  color: Colors.white,
);


TextStyle blackTextStyleForHome = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'Cairo',
  shadows:const [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black,
      offset: Offset(5.0, 5.0),
    ),
  ],
  color: Colors.black,
);


TextStyle smallTextStyle(
  Color textColor,
)  {
  return TextStyle(
  fontSize: 14.sp,

  fontFamily: 'Cairo',
  height: 1.5,
  color: textColor,
);}
// TextStyle smallTextStyleWithgreyColor = TextStyle(
//   fontSize: 14.sp,

//   fontFamily: 'Cairo',
//   height: 1.5,
//   color: Colors.grey,
// );
// TextStyle smallTextStyleWithWhiteColor = TextStyle(
//   fontSize: 14.sp,

//   fontFamily: 'Cairo',
//   height: 1.5,
//   color: Colors.white,
// );
// TextStyle smallTextStyleWithblueColor = TextStyle(
//   fontSize: 14.sp,
//   fontFamily: 'Cairo',
//   height: 1.5,
//   color: Colors.blue,
// );
