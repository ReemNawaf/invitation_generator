import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/widgets/form_widgets/form_field.dart';

class EventLocationField extends StatelessWidget {
  const EventLocationField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    return AppFormField(
      spacing: lang == english ? 8.0 : 0.0,
      initialValue: 'location',
      label: getTr(context, 'city')!,
      hint: getTr(context, 'ex_city')!,
      save: (eventLocation) {},
      validate: (value) {
        if (value!.isEmpty || value.length < 3 || value.length > 12) {
          String errorMes;
          if (value.isEmpty) {
            errorMes = getTr(context, 'you_didnot_enter_the_location_name')!;
          } else if (value.length < 3) {
            errorMes = getTr(context, 'location_name_is_too_short')!;
          } else if (value.length > 12) {
            errorMes = getTr(context, 'location_name_is_too_long')!;
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
