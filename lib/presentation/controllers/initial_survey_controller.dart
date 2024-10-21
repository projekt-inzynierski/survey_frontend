import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/initial_survey_service.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/domain/models/initial_survey_response.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/static/routes.dart';

class InitialSurveyController extends ControllerBase{
  late int questionIndexFrom;
  late int questionIndexTo;
  late RxList<InitialSurveyQuestion> questions;
  late Map<String, InitialSurveyQuestionResponse> responsesIdMappings;
  bool get isLastStartSurveyScreen => questionIndexTo == questions.length - 1;
  final formKey = GlobalKey<FormState>();
  final InitialSurveyService _service;

  InitialSurveyController(this._service);

  void next() async{
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (!isValid){
      return;
    }

    if (isLastStartSurveyScreen){
      await submit();
    }
    else{
      furtherQuestions();
    }
  }

  Future submit() async{
    try{
      final result = await _service.submit(InitialSurveyResponse(questionResponses: responsesIdMappings.values.toList()));

      if (result.error != null || result.statusCode == 201){
        await Get.offAllNamed('/home');
      } else{
        handleSomethingWentWrong(result.error);
      }

    } catch(e){
      //TODO: maybe more specyfic handler should be done here ???
      handleSomethingWentWrong(e);
    }
  }

  void furtherQuestions(){
    Get.toNamed(Routes.initialSurveyQuestions, arguments: {
      "questions": questions,
      "responsesIdMappings": responsesIdMappings,
      "questionIndexFrom": questionIndexTo + 1,
      "questionIndexTo": questions.length - questionIndexTo - 1 < 5 ? questions.length - 1 : questionIndexTo + 5
    }, preventDuplicates: false);
  }

  void loadGetArguments(){
    questionIndexFrom = Get.arguments['questionIndexFrom'];
    questionIndexTo = Get.arguments['questionIndexTo'];
    questions = Get.arguments['questions'];
    responsesIdMappings = Get.arguments['responsesIdMappings'];
  }
}