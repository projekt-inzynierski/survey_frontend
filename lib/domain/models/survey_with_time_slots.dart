import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/domain/models/time_slot_dto.dart';

part 'survey_with_time_slots.g.dart';

@JsonSerializable()
class SurveyWithTimeSlots {
  final SurveyDto survey;
  final List<TimeSlotDto> surveySendingPolicyTimes;

  SurveyWithTimeSlots(
      {required this.survey, required this.surveySendingPolicyTimes});

  factory SurveyWithTimeSlots.fromJson(Map<String, dynamic> json) =>
      _$SurveyWithTimeSlotsFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyWithTimeSlotsToJson(this);
}
