import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/pages/form_page.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/box_dec.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/shared/text_styles.dart';
import 'package:invitation_generator/widgets/app_btn.dart';
import 'package:invitation_generator/widgets/change_language.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final lang = Localizations.localeOf(context).languageCode;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPurplesColor.shade800,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(40.0),
                alignment:
                    lang == arabic ? Alignment.topLeft : Alignment.topRight,
                child: const ChangeLanguage()),
            //const Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/ipad_image_$lang.png',
                      ),
                    ),
                  ),
                  Text(
                    getTr(context, 'Hello, Dash!')!,
                    style: kTitle3Style.copyWith(
                        height: lang == english ? 1.5 : 2.1),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    getTr(context, 'to_be_able_to_create_invitations')!,
                    style: kCalloutStyle.copyWith(
                        height: lang == english ? 1.5 : 2.1),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getTr(context, 'you_just_need_to_follow')!,
                        style: kCalloutStyle.copyWith(
                            height: lang == english ? 1.5 : 2.1),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 14.0),
                        child: Text(
                          '$appStepsNum ${getTr(context, 'steps')}',
                          style: kCaption1Style,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: kAppBorderRadius,
                          color: kPurplesColor.shade400.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  AppButton(
                    label: getTr(context, 'create_invitation')!,
                    onPressed: () => Navigator.pushNamed(
                      context,
                      FormPage.routeName,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
