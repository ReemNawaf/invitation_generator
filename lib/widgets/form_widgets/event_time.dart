import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/text_styles.dart';

class EventTime extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const EventTime({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _selectTime(BuildContext context, WidgetRef ref) async {
      TimeOfDay selectedTime = ref.watch(eventTimeProvider);
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial,
      );
      if (timeOfDay != null && timeOfDay != selectedTime) {
        ref.watch(invitationProvider).setEventTime(timeOfDay);
      }
    }

    return Consumer(builder: (context, ref, _) {
      final localizations = MaterialLocalizations.of(context);
      final formattedTimeOfDay =
          localizations.formatTimeOfDay(ref.read(eventTimeProvider));

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getTr(context, 'time')!,
            style: kSubheadStyle.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
          Text(formattedTimeOfDay, style: kSubheadStyle),
          TextButton(
            onPressed: () => _selectTime(context, ref),
            child: Text(
              getTr(context, 'choose_hour')!,
              style: kSubheadStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: kBluesColor.shade400,
              ),
            ),
          ),
        ],
      );
    });
  }
}
