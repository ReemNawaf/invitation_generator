import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/pages/preview_page.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/shared/text_styles.dart';
import 'package:invitation_generator/shared/ui_helpers.dart';
import 'package:invitation_generator/widgets/app_bar.dart';
import 'package:invitation_generator/widgets/app_btn.dart';
import 'package:invitation_generator/widgets/app_title.dart';

class ChoosingTemplatePage extends StatelessWidget {
  static const String routeName = '/choosing_template_page';
  const ChoosingTemplatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const AppAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTitle(
                      title: getTr(context, 'choose_the_template')!,
                      stepNum: 2,
                    ),
                    sizedBox,
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.87,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ThemeCardOption(
                          index: index,
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                    AppButton(
                      label: getTr(context, 'next')!,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        PreviewPage.routeName,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeCardOption extends StatelessWidget {
  const ThemeCardOption({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final currentTheme = invThemes[0];
    final isSelected = invThemes[index] == currentTheme;
    var cardColor = getThemeColor(invThemes[index]);
    final lang = Localizations.localeOf(context).languageCode;
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color:
                isSelected ? kBlacksColor.withOpacity(0.7) : Colors.transparent,
            width: isSelected ? 2.0 : 0.0,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: (isSelected)
                ? cardColor.withOpacity(0.4)
                : cardColor.withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: (isSelected)
                      ? cardColor.withOpacity(0.8)
                      : cardColor.withOpacity(0.3),
                ),
                child: SizedBox(
                  width: size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: getThemeDashImage(
                      invThemes[index],
                    ),
                  ),
                ),
              ),
              sizedBox,
              Text(
                lang == arabic
                    ? themesNamesAra[index]
                    : invThemes[index].name.toUpperCase(),
                style: kCardTextStyle.copyWith(
                    height: 1.2, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
