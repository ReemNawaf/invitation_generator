import 'package:flutter/material.dart';
import 'package:invitation_generator/shared/box_dec.dart';
import 'package:invitation_generator/shared/text_styles.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isValid;
  final double spacing;
  final String initialValue;
  final String? Function(String? value) validate;
  final void Function(String? value) save;

  const AppFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.validate,
    required this.save,
    required this.initialValue,
    this.spacing = 0,
    this.isValid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kSubheadStyle.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: spacing),
        SizedBox(
          height: isValid ? 45.0 : 64.0,
          child: TextFormField(
            initialValue: initialValue,
            style: kSubheadStyle,
            textAlign: TextAlign.start,
            decoration: kAppFormsInputDecor(hint: hint, isDense: true),
            keyboardType: TextInputType.multiline,
            onSaved: save,
            validator: validate,
          ),
        ),
      ],
    );
  }
}
