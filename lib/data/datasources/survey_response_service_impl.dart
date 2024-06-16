import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/survey_response_service.dart';
import 'package:survey_frontend/domain/models/create_survey_resopnse_dto.dart';

class SurveyResponseServiceImpl extends APIServiceBase implements SurveyResponseService {
  SurveyResponseServiceImpl(super.dio, {required super.tokenProvider});

  @override
  Future<APIResponse> submitResponse(CreateSurveyResponseDto response) 
   => postAndDeserialize('/api/surveyresponses', response.toJson(), (dynamic obj) => obj);
  
}