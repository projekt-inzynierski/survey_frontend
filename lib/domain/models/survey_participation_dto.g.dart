// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_participation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyParticipationDto _$SurveyParticipationDtoFromJson(
        Map<String, dynamic> json) =>
    SurveyParticipationDto(
      id: json['id'] as String,
      respondentId: json['respondentId'] as String,
      surveyId: json['surveyId'] as String,
      date: json['date'] as String,
      rowVersion: (json['rowVersion'] as num).toInt(),
    );

Map<String, dynamic> _$SurveyParticipationDtoToJson(
        SurveyParticipationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'respondentId': instance.respondentId,
      'surveyId': instance.surveyId,
      'date': instance.date,
      'rowVersion': instance.rowVersion,
    };
