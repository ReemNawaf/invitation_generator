import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:invitation_generator/shared/constants.dart';

class Invitation {
  final String id;
  String inviteeName;
  Gender inviteeGender;
  DateTime eventDate;
  TimeOfDay eventTime;
  String eventName;
  String eventLocation;
  invLanguage language;
  invTheme theme;
  Uint8List? invImageBytes;

  Invitation({
    required this.id,
    required this.inviteeName,
    required this.inviteeGender,
    required this.eventDate,
    required this.eventTime,
    required this.eventName,
    required this.eventLocation,
    required this.language,
    required this.theme,
    this.invImageBytes,
  });
}
