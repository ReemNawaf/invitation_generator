import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/widgets/form_widgets/form_field.dart';

class InviteeNameField extends StatelessWidget {
  const InviteeNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppFormField(
      initialValue: 'invitaion name',
      label: getTr(context, 'invitee_name')!,
      hint: getTr(context, 'ex_invitee_name')!,
      validate: (value) {
        if (value!.isEmpty ||
            value.length < 3 ||
            value.length > maximumCharNum) {
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

        return null;
      },
      save: (inviteeName) {},
      isValid: true,
    );
  }
}
