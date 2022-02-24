import 'package:flutter/material.dart';
import 'package:invitation_generator/shared/app_colors.dart';

const int appStepsNum = 3;
const int maximumCharNum = 18;

enum invLanguage {
  arabic,
  english,
}

enum Direction {
  left,
  right,
}

enum Gender {
  male,
  female,
}

enum invTheme {
  nature,

  violet,
  gold,
  classic,
}

List<invTheme> invThemes = [
  invTheme.nature,
  invTheme.violet,
  invTheme.gold,
  invTheme.classic,
];

List<String> themesNamesAra = [
  'طبيعي',
  'فيوليت',
  'ذهبي',
  'كلاسيك',
];

Image getThemeDashImage(invTheme theme) {
  Image image;

  switch (theme) {
    case invTheme.classic:
      image = Image.asset('assets/images/dash_classic.png');
      break;

    case invTheme.violet:
      image = Image.asset('assets/images/dash_violet.png');
      break;

    case invTheme.gold:
      image = Image.asset('assets/images/dash_gold.png');
      break;

    case invTheme.nature:
      image = Image.asset('assets/images/dash_nature.png');
      break;
    default:
      image = Image.asset('assets/images/dash_classic.png');
  }
  return image;
}

MaterialColor getThemeColor(invTheme theme) {
  MaterialColor color;

  switch (theme) {
    case invTheme.classic:
      color = kBluesColor;
      break;

    case invTheme.violet:
      color = kPurplesColor;
      break;

    case invTheme.gold:
      color = kYellowsColor;

      break;

    case invTheme.nature:
      color = kGreensColor;
      break;
    default:
      color = kBluesColor;
  }
  return color;
}
