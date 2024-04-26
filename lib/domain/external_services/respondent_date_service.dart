import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/create_respondent_data_dto.dart';

abstract class RespondentDataService{
  Future<APIResponse<String>> create(CreateRespondentDataDto dto);
}