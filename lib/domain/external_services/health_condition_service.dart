import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/health_condition_dto.dart';

abstract class HealthConditionService {
  Future<APIResponse<List<HealthConditionDto>>> getHealthConditions();
} 