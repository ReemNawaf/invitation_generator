import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/shared/app_colors.dart';
import 'package:invitation_generator/shared/box_dec.dart';
import 'package:invitation_generator/shared/text_styles.dart';
import 'package:invitation_generator/shared/ui_helpers.dart';
import 'package:invitation_generator/widgets/app_bar.dart';
import 'package:invitation_generator/widgets/app_title.dart';
import 'package:invitation_generator/widgets/form_widgets/event_date.dart';
import 'package:invitation_generator/widgets/form_widgets/event_location.dart';
import 'package:invitation_generator/widgets/form_widgets/event_name.dart';
import 'package:invitation_generator/widgets/form_widgets/event_time.dart';
import 'package:invitation_generator/widgets/form_widgets/form_save_btn.dart';
import 'package:invitation_generator/widgets/form_widgets/gender_field.dart';
import 'package:invitation_generator/widgets/form_widgets/invitee_name_field.dart';

class FormPage extends StatelessWidget {
  static const routeName = 'form_page';
  final _formKey = GlobalKey<FormState>();

  FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Column(
            children: [
              const AppAppBar(),
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    AppTitle(
                      title: getTr(context, 'add_invitaion_information')!,
                      stepNum: 1,
                    ),
                    if (lang == english) const SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        right: 25.0,
                        left: 25.0,
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const InviteeNameField(),
                            const SizedBox(height: 18.0),
                            const GenderField(),
                            sizedBox,
                            const EventLocationField(),
                            sizedBox,
                            EventDate(formKey: _formKey),
                            sizedBox,
                            Row(
                              children: [
                                divider,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    getTr(context, 'if_there_is')!,
                                    style: kFootnoteStyle,
                                  ),
                                ),
                                divider,
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            Container(
                              decoration: BoxDecoration(
                                color: kBluesColor.shade800.withOpacity(0.5),
                                borderRadius: kAppBorderRadius,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: lang == english ? 16.0 : 50.0,
                                vertical: 12.0,
                              ),
                              child: Text(
                                getTr(context, 'event_name_explanation')!,
                                style: kFootnoteStyle.copyWith(height: 1.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            const EventNameField(),
                            sizedBox,
                            EventTime(formKey: _formKey),
                            const SizedBox(height: 26.0),
                            FormSaveButton(formKey: _formKey)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 100.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
