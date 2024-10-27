// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_survey_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSurveyResponseDto _$CreateSurveyResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CreateSurveyResponseDto(
      surveyId: json['surveyId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) =>
              CreateQuestionAnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateSurveyResponseDtoToJson(
        CreateSurveyResponseDto instance) =>
    <String, dynamic>{
      'surveyId': instance.surveyId,
      'answers': instance.answers,
    };
