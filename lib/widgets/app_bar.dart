import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;

    return Container(
      alignment: lang == arabic ? Alignment.bottomRight : Alignment.bottomLeft,
      padding: const EdgeInsets.only(
          right: 12.0, left: 12.0, top: 20.0, bottom: 6.0),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }
}
