import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/widgets/form_widgets/form_field.dart';

class EventNameField extends StatelessWidget {
  const EventNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppFormField(
      initialValue: 'Flutter Festival',
      label: getTr(context, 'event_name')!,
      hint: getTr(context, 'ex_event_name')!,
      save: (eventName) {},
      validate: (value) {
        if (value!.isNotEmpty && (value.length < 3 || value.length > 16)) {
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

        return null;
      },
      isValid: true,
    );
  }
}
