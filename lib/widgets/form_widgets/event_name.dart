import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/widgets/form_widgets/form_field.dart';

class EventNameField extends StatelessWidget {
  const EventNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    return Consumer(builder: (context, ref, _) {
      return AppFormField(
        spacing: lang == english ? 4.0 : 0.0,
        initialValue: ref.read(eventNameProvider),
        label: getTr(context, 'event_name')!,
        hint: getTr(context, 'ex_event_name')!,
        save: (eventName) =>
            ref.watch(invitationProvider).setEventName(eventName ?? ''),
        validate: (value) {
          if (value!.isNotEmpty && (value.length < 3 || value.length > 16)) {
            ref.watch(invitationProvider).changeValidEventName(false);

            String errorMes;
            if (value.length < 3) {
              errorMes = getTr(context, 'event_name_is_too_short')!;
            } else if (value.length > 16) {
              errorMes = getTr(context, 'event_name_is_too_long')!;
            } else {
              errorMes = '';
            }
            return errorMes;
          }

          ref.watch(invitationProvider).changeValidEventName(true);
          return null;
        },
        isValid: ref.watch(hasEnteredValidEventName),
      );
    });
  }
}
