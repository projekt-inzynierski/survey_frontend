import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/health_condition_service.dart';
import 'package:survey_frontend/domain/models/health_condition_dto.dart';

class HealthConditionServiceImpl extends APIServiceBase implements HealthConditionService{
  HealthConditionServiceImpl(super.dio);

  @override
  Future<APIResponse<List<HealthConditionDto>>> getHealthConditions()  => get<List<HealthConditionDto>>('/api/healthconditions');
}