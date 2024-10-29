// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_survey_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartSurveyQuestion _$StartSurveyQuestionFromJson(Map<String, dynamic> json) =>
    StartSurveyQuestion(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      content: json['content'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => StartSurveyOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StartSurveyQuestionToJson(
        StartSurveyQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'content': instance.content,
      'options': instance.options,
    };

StartSurveyOption _$StartSurveyOptionFromJson(Map<String, dynamic> json) =>
    StartSurveyOption(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$StartSurveyOptionToJson(StartSurveyOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'content': instance.content,
    };
