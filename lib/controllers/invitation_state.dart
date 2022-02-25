import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:invitation_generator/shared/constants.dart';

class InvitationState {
  final String id;
  final String inviteeName;
  final Gender inviteeGender;
  final DateTime? eventDate;
  final TimeOfDay? eventTime;
  final String eventName;
  final String eventLocation;
  final invTheme theme;
  final Uint8List? invImageBytes;
  final bool hasValidInviteeName;
  final bool hasValidEventName;
  final bool hasValidLocationName;

  const InvitationState({
    required this.id,
    required this.inviteeName,
    required this.inviteeGender,
    this.eventDate,
    this.eventTime,
    required this.eventName,
    required this.eventLocation,
    required this.theme,
    this.invImageBytes,
    this.hasValidInviteeName = true,
    this.hasValidEventName = true,
    this.hasValidLocationName = true,
  });

  factory InvitationState.inital() {
    return const InvitationState(
      id: '',
      inviteeName: '',
      inviteeGender: Gender.male,
      eventName: '',
      eventLocation: '',
      theme: invTheme.nature,
    );
  }

  // InvitationState copyWith({
  //   String? inviteeName,
  //   Gender? inviteeGender,
  //   DateTime? eventDate,
  //   TimeOfDay? eventTime,
  //   String? eventName,
  //   String? eventLocation,
  //   invTheme? theme,
  //   Uint8List? invImageBytes,
  //   InvitationState? status,
  //   bool? hasValidInviteeName,
  //   bool? hasValidEventName,
  //   bool? hasValidLocationName,
  // }) {
  //   return InvitationState(
  //     id: id,
  //     inviteeName: inviteeName ?? this.inviteeName,
  //     inviteeGender: inviteeGender ?? this.inviteeGender,
  //     eventDate: eventDate ?? this.eventDate,
  //     eventTime: eventTime ?? this.eventTime,
  //     eventName: eventName ?? this.eventName,
  //     eventLocation: eventLocation ?? this.eventLocation,
  //     theme: theme ?? this.theme,
  //     invImageBytes: invImageBytes ?? this.invImageBytes,
  //     hasValidInviteeName: hasValidInviteeName ?? this.hasValidInviteeName,
  //     hasValidEventName: hasValidEventName ?? this.hasValidEventName,
  //     hasValidLocationName: hasValidLocationName ?? this.hasValidLocationName,
  //   );
  // }
}
