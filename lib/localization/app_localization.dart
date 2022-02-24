import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'localization_constants.dart';

class DemoLocalization {
  final Locale local;

  DemoLocalization(this.local);

  static DemoLocalization of(BuildContext context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization)!;
  }

  // put these values inside a json file => load this json file inside our code => use it
  Map<String, String> _localizedValues = {};

  Future<void> load() async {
    final jsonStringValues = await rootBundle
        .loadString('lib/localization/lang/${local.languageCode}.json');

    final mappedJson = json.decode(jsonStringValues) as Map<String, dynamic>;

    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getTrValue(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<DemoLocalization> delegate =
      _DemoLocalizationDelegate();
}

class _DemoLocalizationDelegate
    extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // Put here the supported languages
    return [english, arabic].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    final localization = DemoLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationDelegate old) => false;
}
