import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invitation_generator/controllers/invitation_state.dart';
import 'package:invitation_generator/shared/constants.dart';

final inviIdProvider = StateProvider((ref) => '');
final inviteeNameProvider = StateProvider((ref) => '');
final inviteeGenderProvider = StateProvider((ref) => Gender.male);
final eventDateProvider = StateProvider((ref) => DateTime.now());
final eventTimeProvider = StateProvider((ref) => TimeOfDay.now());
final eventNameProvider = StateProvider((ref) => '');
final eventLocationProvider = StateProvider((ref) => '');
final inviThemeProvider = StateProvider((ref) => invTheme.nature);
final inviImageBytesProvider = StateProvider<Uint8List?>((ref) => null);

final hasEnteredValidInviteeName = StateProvider((ref) => true);
final hasEnteredValidLocationName = StateProvider((ref) => true);
final hasEnteredValidEventName = StateProvider((ref) => true);

final invitationProvider =
    Provider<InvitationNotifier>((ref) => InvitationNotifier(ref.read));

class InvitationNotifier extends StateNotifier<InvitationState> {
  InvitationNotifier(this.read) : super(InvitationState.inital());
  final Reader read;

  void setInviteeName(String inviteeName) =>
      read(inviteeNameProvider.state).state = inviteeName;
  void setInviteeGender(Gender gender) =>
      read(inviteeGenderProvider.state).state = gender;
  void setEventDate(DateTime date) =>
      read(eventDateProvider.state).state = date;
  void setEventTime(TimeOfDay time) =>
      read(eventTimeProvider.state).state = time;
  void setEventLocation(String location) =>
      read(eventLocationProvider.state).state = location;
  void setEventName(String name) => read(eventNameProvider.state).state = name;
  void setTheme(invTheme theme) => read(inviThemeProvider.state).state = theme;
  void setImageBytes(Uint8List? bytes) =>
      read(inviImageBytesProvider.state).state = bytes;

  void changeValidInviteeName(bool isValid) =>
      read(hasEnteredValidInviteeName.state).state = isValid;
  void changeValidLocationName(bool isValid) =>
      read(hasEnteredValidLocationName.state).state = isValid;
  void changeValidEventName(bool isValid) =>
      read(hasEnteredValidEventName.state).state = isValid;

  void reset() {
    state = InvitationState.inital();

    read(inviIdProvider.state).state = '';
    read(inviteeNameProvider.state).state = '';
    read(inviteeGenderProvider.state).state = Gender.male;
    read(eventDateProvider.state).state = DateTime.now();
    read(eventTimeProvider.state).state = TimeOfDay.now();
    read(eventNameProvider.state).state = '';
    read(eventLocationProvider.state).state = '';
    read(inviThemeProvider.state).state = invTheme.nature;
    read(inviImageBytesProvider.state).state = null;
    read(hasEnteredValidInviteeName.state).state = true;
    read(hasEnteredValidLocationName.state).state = true;
    read(hasEnteredValidEventName.state).state = true;
    read(invitationProvider).state = InvitationState.inital();
  }
}
