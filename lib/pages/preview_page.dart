import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/controllers/invitation_controller.dart';
import 'package:invitation_generator/home_page.dart';
import 'package:invitation_generator/localization/localization_constants.dart';
import 'package:invitation_generator/pages/form_page.dart';
import 'package:invitation_generator/shared/ui_helpers.dart';
import 'package:invitation_generator/utils/utils.dart';
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
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppTitle(
                            title:
                                getTr(context, 'preview_invitaion_and_share')!,
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
                          Consumer(
                            builder: (context, ref, child) => AppButton(
                              label: getTr(context, 'share')!,
                              hasIcon: true,
                              onPressed: () async {
                                ref.watch(invitationProvider).setImageBytes(
                                    await Utils.capture(_globalKey!));

                                if (ref.watch(inviImageBytesProvider) != null) {
                                  Utils.shareInvAsPNG(
                                    bytes: ref.watch(inviImageBytesProvider)!,
                                    invPath: ref.watch(inviIdProvider),
                                  );
                                }
                              },
                            ),
                          ),
                          sizedBox,
                          Consumer(
                            builder: (context, ref, child) => AppButton(
                                label: getTr(context, 'create_new_invitation')!,
                                hasIcon: true,
                                icon: Icons.edit,
                                onPressed: () {
                                  ref.read(invitationProvider).reset();
                                  Navigator.pushNamed(
                                    context,
                                    HomePage.routeName,
                                  );
                                }),
                          ),
                        ],
                      ),
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
