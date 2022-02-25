import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/text_styles.dart';

class EventDate extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const EventDate({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
      final initialDate = ref.read(eventDateProvider);
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ),
      );

      if (picked != null && picked != initialDate) {
        ref.watch(invitationProvider).setEventDate(picked);
        formKey.currentState!.save();
      }
    }

    return Consumer(builder: (context, ref, _) {
      final date = ref.watch(eventDateProvider);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTr(context, 'day_and_date')!,
                style: kSubheadStyle.copyWith(
                    fontWeight: FontWeight.bold, height: 1.5),
              ),
              Text(
                '${DateFormat.EEEE(lang).format(date)}${getTr(context, 'comma')} ${DateFormat.yMMMd(lang).format(date)}',
                style: kSubheadStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    height: lang == english ? 1.1 : 1.5),
              ),
            ],
          ),
          Container(
            // color: Colors.red,
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
              onPressed: () => _selectDate(context, ref),
              child: Text(
                getTr(context, 'change')!,
                style: kSubheadStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kBluesColor.shade400,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
