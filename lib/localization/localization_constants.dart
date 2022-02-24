import 'package:flutter/cupertino.dart';
import 'package:invitation_generator/localization/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? getTr(BuildContext context, String key) {
  return DemoLocalization.of(context).getTrValue(key);
}

// Language Code
const String english = 'en';
const String arabic = 'ar';

const String englishCode = 'languageCode';

Future<void> setLocale(String languageCode) async {
  final _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(englishCode, languageCode);
}

Future<Locale> getLocale() async {
  //final Locale appLocale = Localizations.localeOf(context);
  final _prefs = await SharedPreferences.getInstance();

  final languageCode = _prefs.getString(englishCode) ?? arabic;
  return Locale(languageCode);
}
