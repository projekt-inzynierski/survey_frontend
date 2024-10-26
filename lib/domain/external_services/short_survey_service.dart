import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/short_survey_dto.dart';

abstract class ShortSurveyService {
  Future<APIResponse<List<SurveyWithTimeSlots>>> getShortSurvey();
}
