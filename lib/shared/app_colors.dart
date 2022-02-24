import 'package:flutter/material.dart';

//  SYSTEM COLORS
//  ------------------------
//  Blacks
const int kBlackColor = 0xFF000000;
MaterialColor kBlacksColor = const MaterialColor(
  kBlackColor,
  <int, Color>{
    400: Color(0xFF000000),
    800: Color.fromARGB(255, 65, 65, 65),
  },
);
Color kWhiteColor = const Color(0xFFFFFFFF);
//  Purple
const int kPurpleColor = 0xFF9897F4;
const MaterialColor kPurplesColor = MaterialColor(
  kPurpleColor,
  <int, Color>{
    400: Color.fromARGB(255, 130, 128, 247),
    800: Color.fromARGB(255, 199, 198, 253),
  },
);
//  Blue
const int kBlueColor = 0xFF8AE3FF;
const MaterialColor kBluesColor = MaterialColor(
  kBlueColor,
  <int, Color>{
    400: Color.fromARGB(255, 83, 163, 255),
    800: Color.fromARGB(255, 196, 223, 255),
  },
);
//  Green
const int kGreenColor = 0xFF06D6A0;
const MaterialColor kGreensColor = MaterialColor(
  kGreenColor,
  <int, Color>{
    400: Color(0xFF06D6A0), // kGreenColor
    600: Color(0xFF73FFDB),
    800: Color(0xFFBFFFEF),
  },
);
// Yellow
const int kYellowColor = 0xFFFFCE51;
const MaterialColor kYellowsColor = MaterialColor(
  kYellowColor,
  <int, Color>{
    400: Color(0xFFFFCE51), // kYellowColor
    600: Color(0xFFFFDE89),
    800: Color(0xFFFFECBA),
  },
);
// Red
const int kRedColor = 0xFFFF7A92;
const MaterialColor kRedsColor = MaterialColor(
  kRedColor,
  <int, Color>{
    400: Color(0xFFFF5372),
    500: Color(0xFFFF7A92), // kRedColor
    600: Color(0xFFFF97AF),
    700: Color(0xFFFFD8E1),
  },
);
// ------------------------
// LABLE COLORS
// ------------------------
const kPrimaryLableColor = Color(0xFF2A2536);
const kSecondaryLableColor = Color(0xFF3C3F53);
const kTertiaryLableColor = Color(0xFF6A6D81);
const kQuarternaryLableColor = Color(0xFFD4D2D8);

// ------------------------
// UI COLORS
// ------------------------
const kSuccessUIColor = Color(0xFF06D6A0);
const kWarningUIColor = Color(0xFFFFDA57);
const kErrorUIColor = Color(0xFFFF7A92);
const kShadowColor = Color.fromRGBO(72, 76, 82, 0.16);
const kIconColor = Color(0xFF6A6D81);

/* In some point I should try this :)
const int kPurpleColor = 0xFF9897F4;
const MaterialColor kPurplesColor = MaterialColor(
  kPurpleColor,
  <int, Color>{
    400: Color(0xFF8B8AE7),
    500: Color(kPurpleColor),
    600: Color(0xFFB9B8FF),
  },
);
*/