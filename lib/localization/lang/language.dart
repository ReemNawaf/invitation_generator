import 'package:invitation_generator/localization/localization_constants.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList = [
    Language(1, 'الْعَرَبِيَّة', arabic),
    Language(2, 'english', english),
  ];
}
