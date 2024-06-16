import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/create_survey_resopnse_dto.dart';

abstract class SurveyResponseService{
  //TODO: Change the type from dynamic to actual type returned from the API
  Future<APIResponse> submitResponse(CreateSurveyResponseDto response);
}