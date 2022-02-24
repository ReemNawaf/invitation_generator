import 'package:flutter/material.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/box_dec.dart';
import 'package:invitation_generator/shared/text_styles.dart';

import '../localization/localization_constants.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool hasIcon;
  final String label;
  final IconData? icon;
  const AppButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.icon = Icons.share,
      this.hasIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final text = Text(
      label,
      style: kSubheadStyle.copyWith(
          color: kWhiteColor, fontWeight: FontWeight.bold),
    );
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: kBlacksColor,
      hoverColor: kWhiteColor,
      focusColor: kWhiteColor,
      highlightColor: kWhiteColor,
      splashColor: kWhiteColor,
      padding: EdgeInsets.symmetric(
          vertical: lang == arabic ? 10 : 16.0, horizontal: 30),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: kAppBorderRadius,
      ),
      child: !hasIcon
          ? text
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text,
                const SizedBox(width: 8),
                Icon(icon, color: kWhiteColor),
              ],
            ),
    );
  }
}
