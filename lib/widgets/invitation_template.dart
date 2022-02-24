import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/shared/text_styles.dart';
import 'package:invitation_generator/shared/ui_helpers.dart';

const double imageWidth = 100;
const String space = ' ';
const newLine = TextSpan(text: '\n');

class InvitationTemplate extends StatelessWidget {
  const InvitationTemplate({Key? key}) : super(key: key);
  final hasEventName = true;

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final date = '${DateFormat.MMMMd(lang).format(DateTime.now())} ';
    const color = kPurplesColor;

    const inviteeName = '';
    const inviteeGender = Gender.male;
    const eventLocation = '';

    final eventDay = TextSpan(
      text: space + DateFormat('EEEE').format(DateTime.now()),
      style: kCardTextStyle.copyWith(
        color: kBluesColor.shade400,
        fontWeight: FontWeight.bold,
      ),
    );

    final eventDate = TextSpan(
      text: date,
      style: kCardTextStyle.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
    const eventName = 'Flutter Festival';

    final localizations = MaterialLocalizations.of(context);
    final eventTime = localizations.formatTimeOfDay(TimeOfDay.now());

    Size size = MediaQuery.of(context).size;
    final myDearFriend = (lang == english || inviteeGender == Gender.female)
        ? getTr(context, 'my_dear_friend')
        : getTr(context, 'my_dear_friend_female');

    Widget dashImage = Container(
      height: imageWidth,
      width: imageWidth,
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(
          color: color,
          width: 5,
        ),
      ),
      child: getThemeDashImage(invTheme.violet),
    );

    Widget headerAndName = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: color,
            child: Text(
              getTr(context, 'invitation_card')!,
              style: kbodyeStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: lang == arabic ? 8.0 : 6.0),
          Container(
            padding: const EdgeInsets.only(right: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$myDearFriend',
                  style: kCardTextStyle.copyWith(
                      fontWeight: FontWeight.bold, height: 1.5),
                ),
                Text(
                  inviteeName,
                  style: kCardTextStyle.copyWith(
                      height: lang == arabic ? 1.6 : 1.1,
                      color: color,
                      fontWeight: FontWeight.bold),
                ),
                if (hasEventName)
                  Text(
                    getTr(context, 'i_am_pleased')!,
                    style: kCardTextStyle.copyWith(
                      height: lang == arabic ? 1.6 : 1.1,
                    ),
                  )
                else
                  sizedBox,
              ],
            ),
          ),
        ],
      ),
    );

    final firstContentTempENG = [
      TextSpan(text: space + getTr(context, 'on_for_day')!),
      eventDay,
      TextSpan(text: getTr(context, 'comma_for_date')! + space),
      eventDate,
      TextSpan(text: getTr(context, 'in_for_city')! + space),
      TextSpan(
        text: 'Jeddah',
        style: kCardTextStyle.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    final firstContentTempAR = [
      eventDay,
      const TextSpan(text: '\n'),
      TextSpan(text: getTr(context, 'in_for_city')! + space),
      const TextSpan(text: '\n'),
      TextSpan(text: getTr(context, 'on_for_day_M')! + space),
      eventDate,
    ];

    final secondContentTempENG = [
      TextSpan(
        text: eventName,
        style: kCardTextStyle.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
          height: 1.1,
        ),
      ),
      TextSpan(
          text: space +
              getTr(context, 'event')! +
              space +
              getTr(context, 'to_be_held_in')!,
          style: kTestStyleWith1Height),
      TextSpan(
        text: space + eventLocation,
        style: kCardTextStyle.copyWith(
            color: color, fontWeight: FontWeight.bold, height: 1.1),
      ),
      TextSpan(
          text: space + getTr(context, 'on_for_day')!,
          style: kTestStyleWith1Height),
      eventDay,
      TextSpan(
          text: getTr(context, 'comma_for_date')!,
          style: kTestStyleWith1Height),
      TextSpan(
        text: space + date,
        style: kCardTextStyle.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          height: 1.1,
        ),
      ),
      TextSpan(
          text: space + getTr(context, 'at_for_time')!,
          style: kTestStyleWith1Height),
      TextSpan(
        text: space + eventTime,
        style: kCardTextStyle.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
          height: 1.1,
        ),
      ),
    ];

    final secondContentTempAR = [
      TextSpan(
        text: 'invitation.getEventName',
        style: kCardTextStyle.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      if (lang == english) TextSpan(text: getTr(context, 'event')!),
      const TextSpan(text: '\n'),
      TextSpan(text: getTr(context, 'to_be_held_in')!),
      TextSpan(
        text: eventLocation,
        style: kCardTextStyle.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(text: getTr(context, 'at_for_time')!),
      TextSpan(
        text: eventTime,
        style: kCardTextStyle.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(text: '\n'),
      TextSpan(
        text: date,
        style: kCardTextStyle.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
      eventDay,
      TextSpan(text: getTr(context, 'comma_for_date')!),
    ];

    // card size
    return Container(
      height: size.height * 0.45,
      width: size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.shade800,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: kWhiteColor,
            height: size.height * 0.41,
            width: size.width * 0.8,
          ),
          Container(
            alignment: Alignment.center,
            height: size.height * 0.38,
            width: size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lang == arabic ? dashImage : headerAndName,
                    const SizedBox(width: 16),
                    lang == arabic ? headerAndName : dashImage
                  ],
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: !hasEventName
                          ? getTr(context, 'i_will_be_so_glad_to_see_you')
                          : '${getTr(context, 'to_attend')} ${lang == arabic ? '${getTr(context, 'event')}' : ''}',
                      style: kCardTextStyle.copyWith(height: 1.4),
                      children: !hasEventName
                          // fisrt content template
                          ? [
                              if (lang == english)
                                ...firstContentTempENG
                              else
                                ...firstContentTempAR
                            ]

                          // second content template
                          : [
                              if (lang == english)
                                ...secondContentTempENG
                              else
                                ...secondContentTempAR,
                            ]),
                ),
                if (lang == arabic) const SizedBox(height: 5.0),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTr(context, 'best_regards')!,
                          style: kCaption1Style.copyWith(
                              height: lang == arabic ? 1.43 : 1.1),
                        ),
                        Text(
                          getTr(context, 'dash')!,
                          style: kCaption1Style.copyWith(
                              fontWeight: FontWeight.bold,
                              height: 1.43,
                              color: color),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
