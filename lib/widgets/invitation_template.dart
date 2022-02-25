import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/shared/text_styles.dart';

const double imageWidth = 100;
const String space = ' ';
const newLine = TextSpan(text: '\n');

class InvitationTemplate extends ConsumerWidget {
  const InvitationTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = Localizations.localeOf(context).languageCode;

    final date = ref.watch(eventDateProvider);
    final dateFormatted = '${DateFormat.MMMMd(lang).format(date)} ';

    final inviteeName = ref.watch(inviteeNameProvider);
    final inviteeGender = ref.watch(inviteeGenderProvider);
    final eventLocation = ref.watch(eventLocationProvider);

    final eventName = ref.watch(eventNameProvider);
    final hasEventName = eventName.isNotEmpty;

    final theme = ref.watch(inviThemeProvider);
    final color = getThemeColor(theme).shade400;

    final eventDay = TextSpan(
      text: space + DateFormat.EEEE(lang).format(date),
      style: kBodyText2Style.copyWith(
        color: kBluesColor.shade400,
        fontWeight: FontWeight.bold,
      ),
    );

    final eventDate = TextSpan(
      text: dateFormatted,
      style: kBodyText2Style.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );

    final localizations = MaterialLocalizations.of(context);
    final eventTime =
        localizations.formatTimeOfDay(ref.watch(eventTimeProvider));

    Size size = MediaQuery.of(context).size;
    final myDearFriend = (lang == english || inviteeGender == Gender.male)
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
      child: getThemeDashImage(theme),
    );

    Widget headerAndName = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: color,
            padding:
                EdgeInsets.symmetric(vertical: lang == english ? 6.0 : 0.0),
            child: Text(
              getTr(context, 'invitation_card')!,
              style: kbodyeStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: lang == english ? 14 : 17,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: hasEventName ? 8.0 : 14.0),
          Container(
            padding: const EdgeInsets.only(right: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$myDearFriend',
                  style: kBodyText2Style.copyWith(
                      fontWeight: FontWeight.bold,
                      height: hasEventName ? 1.4 : 1.8),
                ),
                Text(
                  inviteeName,
                  style: kBodyText2Style.copyWith(
                      height: lang == arabic ? 1.6 : 1.9,
                      color: color,
                      fontWeight: FontWeight.bold),
                ),
                if (hasEventName)
                  Text(
                    getTr(context, 'i_am_pleased')!,
                    style: kBodyText2Style.copyWith(
                      height: lang == arabic ? 1.2 : 1.4,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );

    final firstContentTempENG = [
      newLine,
      TextSpan(text: space + getTr(context, 'on_for_day')!),
      eventDay,
      TextSpan(text: getTr(context, 'comma_for_date')! + space),
      eventDate,
      newLine,
      TextSpan(text: getTr(context, 'in_for_city')! + space),
      TextSpan(
        text: eventLocation,
        style: kBodyText2Style.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(text: '.'),
    ];

    final firstContentTempAR = [
      eventDay,
      const TextSpan(text: '\n'),
      TextSpan(text: getTr(context, 'in_for_city')! + space),
      TextSpan(
        text: eventLocation,
        style: kBodyText2Style.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(text: '\n'),
      TextSpan(text: getTr(context, 'on_for_day_M')! + space),
      eventDate,
    ];

    final secondContentTempENG = [
      TextSpan(
        text: eventName,
        style: kBodyText2Style.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
          height: 1.4,
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
        style: kBodyText2Style.copyWith(
            color: color, fontWeight: FontWeight.bold, height: 1.4),
      ),
      TextSpan(
          text: space + getTr(context, 'on_for_day')!,
          style: kTestStyleWith1Height),
      eventDay,
      TextSpan(
          text: getTr(context, 'comma_for_date')!,
          style: kTestStyleWith1Height),
      TextSpan(
        text: space + dateFormatted,
        style: kBodyText2Style.copyWith(
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
        style: kBodyText2Style.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
          height: 1.1,
        ),
      ),
    ];

    final secondContentTempAR = [
      TextSpan(
        text: eventName,
        style: kBodyText2Style.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
          text: space + getTr(context, 'to_be_held_in')!,
          style: kBodyText2Style),
      TextSpan(
        text: space + eventLocation,
        style: kBodyText2Style.copyWith(
          color: kBluesColor.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(text: space + getTr(context, 'at_for_time')! + space),
      TextSpan(
        text: eventTime,
        style: kBodyText2Style.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(text: space + getTr(context, 'on_for_day')!),
      eventDay,
      newLine,
      TextSpan(text: space + getTr(context, 'comma_for_date')!),
      TextSpan(
        text: space + dateFormatted,
        style: kBodyText2Style.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    // card size
    return Container(
      height: size.height * 0.45,
      width: size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getThemeColor(theme).shade800,
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
                if (lang == arabic) const SizedBox(height: 10.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: !hasEventName
                          ? getTr(context, 'i_will_be_so_glad_to_see_you')
                          : '${getTr(context, 'to_attend')} ${lang == arabic ? '${getTr(context, 'event')} ' : ''}',
                      style: kCardTextStyle(lang),
                      children: !hasEventName
                          // fisrt content template
                          ? [
                              if (lang == english)
                                ...firstContentTempENG
                              else
                                ...firstContentTempAR,
                              const TextSpan(text: '.'),
                            ]

                          // second content template
                          : [
                              if (lang == english)
                                ...secondContentTempENG
                              else
                                ...secondContentTempAR,
                              const TextSpan(text: '.'),
                            ]),
                ),
                if (lang == arabic) const SizedBox(height: 6.0),
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
                            color: color,
                          ),
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
