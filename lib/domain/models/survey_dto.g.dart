// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyDto _$SurveyDtoFromJson(Map<String, dynamic> json) => SurveyDto(
      id: json['id'] as String,
      name: json['name'] as String,
      rowVersion: json['rowVersion'] as int,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyDtoToJson(SurveyDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rowVersion': instance.rowVersion,
      'sections': instance.sections,
    };

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      id: json['id'] as String,
      order: json['order'] as int,
      name: json['name'] as String,
      visibility: json['visibility'] as String,
      groupId: json['groupId'] as String?,
      rowVersion: json['rowVersion'] as int,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'name': instance.name,
      'visibility': instance.visibility,
      'groupId': instance.groupId,
      'rowVersion': instance.rowVersion,
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      order: json['order'] as int,
      content: json['content'] as String,
      questionType: json['questionType'] as String,
      required: json['required'] as bool,
      rowVersion: json['rowVersion'] as int,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberRange: json['numberRange'] == null
          ? null
          : NumberRange.fromJson(json['numberRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'content': instance.content,
      'questionType': instance.questionType,
      'required': instance.required,
      'rowVersion': instance.rowVersion,
      'options': instance.options,
      'numberRange': instance.numberRange,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: json['id'] as String,
      order: json['order'] as int,
      label: json['label'] as String,
      showSection: json['showSection'] as String?,
      rowVersion: json['rowVersion'] as int,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'label': instance.label,
      'showSection': instance.showSection,
      'rowVersion': instance.rowVersion,
    };

NumberRange _$NumberRangeFromJson(Map<String, dynamic> json) => NumberRange(
      id: json['id'] as String,
      from: json['from'] as int,
      to: json['to'] as int,
      fromLabel: json['fromLabel'] as String?,
      toLabel: json['toLabel'] as String?,
      rowVersion: json['rowVersion'] as int,
    );

Map<String, dynamic> _$NumberRangeToJson(NumberRange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'fromLabel': instance.fromLabel,
      'toLabel': instance.toLabel,
      'rowVersion': instance.rowVersion,
    };
