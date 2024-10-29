// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_with_time_slots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyWithTimeSlots _$SurveyWithTimeSlotsFromJson(Map<String, dynamic> json) =>
    SurveyWithTimeSlots(
      survey: SurveyDto.fromJson(json['survey'] as Map<String, dynamic>),
      surveySendingPolicyTimes:
          (json['surveySendingPolicyTimes'] as List<dynamic>)
              .map((e) => TimeSlotDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SurveyWithTimeSlotsToJson(
        SurveyWithTimeSlots instance) =>
    <String, dynamic>{
      'survey': instance.survey,
      'surveySendingPolicyTimes': instance.surveySendingPolicyTimes,
    };
