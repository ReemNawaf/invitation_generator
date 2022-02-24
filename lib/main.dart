import 'package:flutter/material.dart';
import 'package:invitation_generator/home_page.dart';
import 'package:invitation_generator/localization/app_localization.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    final state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Certificate Generator',
      locale: _locale,
      localizationsDelegates: const [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(english, 'US'), // english, United States
        Locale(arabic, 'SA'), // arabic, Saudi Arabia
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (final locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
