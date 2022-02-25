import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/box_dec.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/shared/text_styles.dart';

final selectedChoiceColor = kBluesColor[400];
final notSelectedChoiceColor = kBluesColor[800];

class GenderField extends StatelessWidget {
  const GenderField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Row(
        children: [
          Expanded(
            child: getChoiceContainer(
              context,
              gender: ref.watch(inviteeGenderProvider),
              genderChoice: Gender.male,
              text: getTr(context, 'male')!,
              direction: Direction.right,
              notifier: ref.watch(invitationProvider),
            ),
          ),
          Expanded(
            child: getChoiceContainer(
              context,
              gender: ref.watch(inviteeGenderProvider),
              genderChoice: Gender.female,
              text: getTr(context, 'female')!,
              direction: Direction.left,
              notifier: ref.watch(invitationProvider),
            ),
          ),
        ],
      ),
    );
  }

  Widget getChoiceContainer(
    BuildContext context, {
    required String text,
    required Gender genderChoice,
    required Gender gender,
    required Direction direction,
    required InvitationNotifier notifier,
  }) {
    Color color;
    BorderRadius borderRadius;

    final lang = Localizations.localeOf(context).languageCode;

    if (genderChoice == Gender.female) {
      color = gender == Gender.female
          ? selectedChoiceColor!
          : notSelectedChoiceColor!;
    } else {
      color = gender == Gender.female
          ? notSelectedChoiceColor!
          : selectedChoiceColor!;
    }

    if (lang == arabic) {
      borderRadius = direction == Direction.right
          ? const BorderRadius.only(
              topRight: kAppRadius,
              bottomRight: kAppRadius,
            )
          : const BorderRadius.only(
              topLeft: kAppRadius,
              bottomLeft: kAppRadius,
            );
    } else {
      borderRadius = direction == Direction.left
          ? const BorderRadius.only(
              topRight: Radius.circular(45.0),
              bottomRight: Radius.circular(45.0),
            )
          : const BorderRadius.only(
              topLeft: Radius.circular(45.0),
              bottomLeft: Radius.circular(45.0),
            );
    }

    return GestureDetector(
      onTap: () => notifier.setInviteeGender(genderChoice),
      child: Container(
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: kSubheadStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
