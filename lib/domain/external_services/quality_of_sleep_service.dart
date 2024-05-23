import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/quality_of_sleep_dto.dart';

abstract class QualityOfSleepService {
  Future<APIResponse<List<QualityOfSleepDto>>> getQualityOfSleeps();
}