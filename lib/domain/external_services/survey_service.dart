import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';

abstract class SurveyService {
  Future<APIResponse<List<SurveyDto>>> getSurvey();
}
