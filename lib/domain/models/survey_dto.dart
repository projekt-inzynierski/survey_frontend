import 'package:json_annotation/json_annotation.dart';

part 'survey_dto.g.dart';

@JsonSerializable()
class SurveyDto {
  final String id;
  final String name;
  final int rowVersion;
  final List<Section> sections;

  SurveyDto({
    required this.id,
    required this.name,
    required this.rowVersion,
    required this.sections,
  });

  factory SurveyDto.fromJson(Map<String, dynamic> json) =>
      _$SurveyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyDtoToJson(this);
}

@JsonSerializable()
class Section {
  final String id;
  final int order;
  final String name;
  final String visibility;
  final String? groupId;
  final int rowVersion;
  final List<Question> questions;

  Section({
    required this.id,
    required this.order,
    required this.name,
    required this.visibility,
    this.groupId,
    required this.rowVersion,
    required this.questions,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);
}

@JsonSerializable()
class Question {
  final String id;
  final int order;
  final String content;
  final String questionType;
  final bool required;
  final int rowVersion;
  final List<Option>? options;
  final NumberRange? numberRange;

  Question({
    required this.id,
    required this.order,
    required this.content,
    required this.questionType,
    required this.required,
    required this.rowVersion,
    this.options,
    this.numberRange,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Option {
  final String id;
  final int order;
  final String label;
  final String? showSection;
  final int rowVersion;

  Option({
    required this.id,
    required this.order,
    required this.label,
    this.showSection,
    required this.rowVersion,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}

@JsonSerializable()
class NumberRange {
  final String id;
  final int from;
  final int to;
  final String? fromLabel;
  final String? toLabel;
  final int rowVersion;

  NumberRange({
    required this.id,
    required this.from,
    required this.to,
    this.fromLabel,
    this.toLabel,
    required this.rowVersion,
  });

  factory NumberRange.fromJson(Map<String, dynamic> json) =>
      _$NumberRangeFromJson(json);

  Map<String, dynamic> toJson() => _$NumberRangeToJson(this);
}