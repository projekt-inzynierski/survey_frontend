import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/create_survey_resopnse_dto.dart';
import 'package:survey_frontend/domain/models/survey_participation_dto.dart';

abstract class SurveyResponseService{
  Future<APIResponse<SurveyParticipationDto>> submitResponse(CreateSurveyResponseDto response);
}