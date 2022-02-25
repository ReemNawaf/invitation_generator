import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/box_dec.dart';
import 'package:invitation_generator/shared/constants.dart';
import 'package:invitation_generator/shared/text_styles.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final int stepNum;
  const AppTitle({
    Key? key,
    required this.title,
    required this.stepNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: Text(
              '$stepNum ${getTr(context, 'from')} $appStepsNum ${getTr(context, 'steps')}',
              style: kCaption2Style,
            ),
            decoration: BoxDecoration(
              borderRadius: kAppBorderRadius,
              color: kBluesColor.shade800,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: kTitle3Style,
          ),
        ],
      ),
    );
  }
}
