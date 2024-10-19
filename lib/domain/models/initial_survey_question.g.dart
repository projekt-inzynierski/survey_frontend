// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_survey_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitialSurveyQuestion _$InitialSurveyQuestionFromJson(
        Map<String, dynamic> json) =>
    InitialSurveyQuestion(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      content: json['content'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => InitialSurveyOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InitialSurveyQuestionToJson(
        InitialSurveyQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'content': instance.content,
      'options': instance.options,
    };

InitialSurveyOption _$InitialSurveyOptionFromJson(Map<String, dynamic> json) =>
    InitialSurveyOption(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$InitialSurveyOptionToJson(
        InitialSurveyOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'content': instance.content,
    };
