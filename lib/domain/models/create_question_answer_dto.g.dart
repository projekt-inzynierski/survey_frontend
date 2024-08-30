// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_question_answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuestionAnswerDto _$CreateQuestionAnswerDtoFromJson(
        Map<String, dynamic> json) =>
    CreateQuestionAnswerDto(
      questionId: json['questionId'] as String,
      selectedOptions: (json['selectedOptions'] as List<dynamic>?)
          ?.map((e) =>
              CreateSelectedOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      numericAnswer: (json['numericAnswer'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateQuestionAnswerDtoToJson(
        CreateQuestionAnswerDto instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'selectedOptions': instance.selectedOptions,
      'numericAnswer': instance.numericAnswer,
    };
