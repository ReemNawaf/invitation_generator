import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/text_styles.dart';

class EventTime extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const EventTime({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          getTr(context, 'time')!,
          style: kSubheadStyle.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
        const Text('Time of day', style: kSubheadStyle),
        TextButton(
          onPressed: () {},
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
  }
}
