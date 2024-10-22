import 'package:json_annotation/json_annotation.dart';

part 'initial_survey_question.g.dart';

@JsonSerializable()
class InitialSurveyQuestion {
  String id;
  int order;
  String content;
  List<InitialSurveyOption> options;

  InitialSurveyQuestion({
    required this.id,
    required this.order,
    required this.content,
    required this.options,
  });

  factory InitialSurveyQuestion.fromJson(Map<String, dynamic> json) =>
      _$InitialSurveyQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$InitialSurveyQuestionToJson(this);
}

@JsonSerializable()
class InitialSurveyOption {
  String id;
  int order;
  String content;

  InitialSurveyOption({
    required this.id,
    required this.order,
    required this.content,
  });

    factory InitialSurveyOption.fromJson(Map<String, dynamic> json) =>
      _$InitialSurveyOptionFromJson(json);
  Map<String, dynamic> toJson() => _$InitialSurveyOptionToJson(this);
}
