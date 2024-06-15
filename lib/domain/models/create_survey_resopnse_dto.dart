import 'package:survey_frontend/domain/models/create_question_answer_dto.dart';

class CreateSurveyResponseDto{
  final String surveyId;
  final List<CreateQuestionAnswerDto> answers;

  CreateSurveyResponseDto({required this.surveyId, required this.answers});
}