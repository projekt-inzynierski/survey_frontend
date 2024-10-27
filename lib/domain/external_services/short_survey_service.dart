import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/survey_with_time_slots.dart';

abstract class ShortSurveyService {
  Future<APIResponse<List<SurveyWithTimeSlots>>> getSurveysWithTimeSlots();
}
