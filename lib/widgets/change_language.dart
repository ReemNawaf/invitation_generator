import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/lang/language.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/main.dart';
import 'package:invitation_generator/shared/text_styles.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _changeLanguage(Language? language) {
      final _temp = Locale(language!.languageCode);
      // to add it to shared preference
      setLocale(language.languageCode);
      MyApp.setLocale(context, _temp);
    }

    final Locale appLocale = Localizations.localeOf(context);
    final isArabic = appLocale.languageCode != english;
    return GestureDetector(
      child: Text(
        isArabic ? 'English' : 'عربي',
        style: kCalloutStyle.copyWith(
            fontFamily: !isArabic ? 'NotoSansArabic' : 'OpenSans'),
      ),
      onTap: () {
        _changeLanguage(
            isArabic ? Language.languageList[1] : Language.languageList[0]);
      },
    );
  }
}
