import 'package:flutter/material.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/pages/form_page.dart';
import 'package:invitation_generator/shared/ui_helpers.dart';
import 'package:invitation_generator/utils/widget_to_image.dart';
import 'package:invitation_generator/widgets/app_btn.dart';
import 'package:invitation_generator/widgets/app_bar.dart';
import 'package:invitation_generator/widgets/app_title.dart';
import 'package:invitation_generator/widgets/invitation_template.dart';

class PreviewPage extends StatelessWidget {
  static const String routeName = '/preview_page';
  const PreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey? _globalKey;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const AppAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTitle(
                      title: getTr(context, 'preview_invitaion_and_share')!,
                      stepNum: 3,
                    ),
                    sizedBox,
                    WidgetToImage(builder: (capKey) {
                      _globalKey = capKey;
                      return const InvitationTemplate();
                    }),
                    const SizedBox(height: 14.0),
                    AppButton(
                      label: getTr(context, 'edit')!,
                      hasIcon: true,
                      icon: Icons.edit,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        FormPage.routeName,
                      ),
                    ),
                    sizedBox,
                    AppButton(
                      label: getTr(context, 'share')!,
                      hasIcon: true,
                      onPressed: () {},
                    ),
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
