class InitialSurveyResponse{
  List<InitialSurveyQuestionResponse> questionResponses;

  InitialSurveyResponse({required this.questionResponses});
}

class InitialSurveyQuestionResponse{
  String questionId;
  String? optionId;

  InitialSurveyQuestionResponse({required this.questionId, required this.optionId});
}