import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/localization/app_localization.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/pages/choosing_template_page.dart';
import 'package:invitation_generator/pages/form_page.dart';
import 'package:invitation_generator/pages/home_page.dart';
import 'package:invitation_generator/pages/preview_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/text_styles.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

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
        PreviewPage.routeName: (context) => const PreviewPage(),
        FormPage.routeName: (context) => FormPage(),
        ChoosingTemplatePage.routeName: (context) =>
            const ChoosingTemplatePage(),
      },
      initialRoute: HomePage.routeName,
      builder: (context, navigator) {
        final lang = Localizations.localeOf(context).languageCode;

        return Theme(
          data: ThemeData.light().copyWith(
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(
                  headline6: kTitle1Style,
                  headline5: kTitle2Style,
                  headline4: kTitle3Style,
                  headline3: kTitle3Style,
                  headline2: kTitle3Style,
                  headline1: kTitle3Style,
                  bodyText1: kbodyeStyle,
                  bodyText2: kBodyText2Style,
                )
                .apply(
                  fontFamily: lang == arabic ? 'NotoSansArabic' : 'OpenSans',
                ),
            primaryColor: kPurplesColor,
            colorScheme: ColorScheme(
              primary: kPurplesColor,
              secondary: kBlacksColor,
              surface: kWhiteColor,
              background: kBlacksColor,
              error: kRedsColor,
              onPrimary: kWhiteColor,
              onSecondary: kPurplesColor,
              onSurface: kBlacksColor,
              onBackground: kWhiteColor,
              onError: kRedsColor,
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: kWhiteColor,
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryLableColor, width: 1.5),
              ),
            ),
          ),
          child: navigator!,
        );
      },
    );
  }
}
