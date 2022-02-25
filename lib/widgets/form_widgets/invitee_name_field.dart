import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/widgets/form_widgets/form_field.dart';

class InviteeNameField extends StatelessWidget {
  const InviteeNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final lang = Localizations.localeOf(context).languageCode;
      return AppFormField(
        spacing: lang == english ? 6.0 : 0.0,
        initialValue: ref.read(inviteeNameProvider),
        label: getTr(context, 'invitee_name')!,
        hint: getTr(context, 'ex_invitee_name')!,
        validate: (value) {
          if (value!.isEmpty ||
              value.length < 3 ||
              value.length > maximumCharNum) {
            ref.watch(invitationProvider).changeValidInviteeName(false);

            String errorMes;
            if (value.isEmpty) {
              errorMes = getTr(context, 'you_didnot_enter_the_invitee_name')!;
            } else if (value.length < 3) {
              errorMes = getTr(context, 'invitee_name_is_too_short')!;
            } else if (value.length > maximumCharNum) {
              errorMes = getTr(context, 'invitee_name_is_too_long')!;
            } else {
              errorMes = '';
            }

            return errorMes;
          }
          ref.watch(invitationProvider).changeValidInviteeName(true);

          return null;
        },
        save: (inviteeName) =>
            ref.watch(invitationProvider).setInviteeName(inviteeName ?? ''),
        isValid: ref.watch(hasEnteredValidInviteeName),
      );
    });
  }
}
