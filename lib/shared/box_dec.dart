import 'package:flutter/material.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/text_styles.dart';

final kAppBorderRadius = BorderRadius.circular(15);
const kAppRadius = Radius.circular(10);
const kAppCircularRadius = 10.0;
const kAppBorderWidth = 1.5;
const kAppFoucusborderWidth = 2.0;

InputDecoration kAppFormsInputDecor({String hint = '', bool isDense = false}) =>
    InputDecoration(
      hintText: hint,

      hintStyle: kFootnoteStyle.copyWith(color: kTertiaryLableColor),
      errorStyle: kCaption1Style.copyWith(color: kErrorUIColor, height: 1.0),

      errorMaxLines: 2,
      isDense: isDense,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(kAppRadius),
      ),
      // Borders
      // NORMAL
      // 1. INACTIVE
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kBlacksColor, width: kAppBorderWidth),
        borderRadius: const BorderRadius.all(kAppRadius),
      ),
      // 2. ACTIVE
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: kBlacksColor, width: kAppFoucusborderWidth),
        borderRadius: const BorderRadius.all(kAppRadius),
      ),

      // ERROR
      // 1. INACTIVE
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kRedsColor[600]!, width: kAppBorderWidth),
        borderRadius: const BorderRadius.all(kAppRadius),
      ),

      // 2. ACTIVE
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: kErrorUIColor, width: kAppFoucusborderWidth),
        borderRadius: BorderRadius.all(kAppRadius),
      ),
    );
