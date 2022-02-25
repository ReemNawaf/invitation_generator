import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/pages/choosing_template_page.dart';
import 'package:invitation_generator/widgets/app_btn.dart';

class FormSaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const FormSaveButton({Key? key, required this.formKey}) : super(key: key);

  void _trySubmit(BuildContext context, WidgetRef ref) {
    final isVaild = formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isVaild!) {
      formKey.currentState!.save();
      ref.watch(invitationProvider).changeValidEventName(true);
      ref.watch(invitationProvider).changeValidInviteeName(true);
      ref.watch(invitationProvider).changeValidLocationName(true);

      //  Navigate to the next page
      Navigator.pushNamed(
        context,
        ChoosingTemplatePage.routeName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: AppButton(
              label: getTr(context, 'next')!,
              onPressed: () => _trySubmit(context, ref),
            ),
          ),
        ],
      ),
    );
  }
}
