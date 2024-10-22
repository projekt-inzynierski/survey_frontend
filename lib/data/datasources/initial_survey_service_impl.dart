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
  Future<APIResponse> submit(InitialSurveyResponse response){
    return post('/api/respondents',  response.toJson());
  }

  @override
  Future<APIResponse<InitialSurveyResponse>> getMyResponse() =>
      get<InitialSurveyResponse>(
          '/api/respondents',
          (dynamic json) => InitialSurveyResponse.fromJson(json));
}