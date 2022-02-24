import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/pages/choosing_template_page.dart';
import 'package:invitation_generator/widgets/app_btn.dart';

class FormSaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const FormSaveButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            label: getTr(context, 'next')!,
            onPressed: () {
              //  Navigate to the next page
              Navigator.pushNamed(
                context,
                ChoosingTemplatePage.routeName,
              );
            },
          ),
        ),
      ],
    );
  }
}
