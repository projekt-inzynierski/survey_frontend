import 'package:json_annotation/json_annotation.dart';

part 'start_survey_question.g.dart';

@JsonSerializable()
class StartSurveyQuestion {
  String id;
  int order;
  String content;
  List<StartSurveyOption> options;

  StartSurveyQuestion({
    required this.id,
    required this.order,
    required this.content,
    required this.options,
  });

  factory StartSurveyQuestion.fromJson(Map<String, dynamic> json) =>
      _$StartSurveyQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$StartSurveyQuestionToJson(this);
}

@JsonSerializable()
class StartSurveyOption {
  String id;
  int order;
  String content;

  StartSurveyOption({
    required this.id,
    required this.order,
    required this.content,
  });

    factory StartSurveyOption.fromJson(Map<String, dynamic> json) =>
      _$StartSurveyOptionFromJson(json);
  Map<String, dynamic> toJson() => _$StartSurveyOptionToJson(this);
}
