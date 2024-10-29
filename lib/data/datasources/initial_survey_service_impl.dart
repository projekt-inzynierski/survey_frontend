import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/initial_survey_service.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/domain/models/initial_survey_response.dart';

class InitialSurveyServiceImpl extends APIServiceBase implements InitialSurveyService {
  InitialSurveyServiceImpl(super.dio, {required super.tokenProvider});

  @override
  Future<APIResponse<List<InitialSurveyQuestion>>> getInitialSurvey() 
    => get<List<InitialSurveyQuestion>>('/api/initialsurvey',  (dynamic items) => items.map<InitialSurveyQuestion>((e) => InitialSurveyQuestion.fromJson(e)).toList());
  
  @override
  Future<APIResponse> submit(List<InitialSurveyQuestionResponse> response){
    return postMany('/api/respondents',  response.map((e) => e.toJson()).toList());
  }

  @override

  Future<APIResponse<Map<String, dynamic>>> getMyResponse() =>
      get<Map<String, dynamic>>(
          '/api/respondents',
          (dynamic json) => json);
}