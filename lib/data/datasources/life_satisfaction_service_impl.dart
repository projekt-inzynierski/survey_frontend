import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/life_satisfaction_service.dart';
import 'package:survey_frontend/domain/models/life_satisfaction_dto.dart';

class LifeSatisfactionServiceImpl extends APIServiceBase implements LifeSatisfactionService {
  LifeSatisfactionServiceImpl(super.dio);

  @override
  Future<APIResponse<List<LifeSatisfactionDto>>> getLifeSatisfactions() => get<List<LifeSatisfactionDto>>("/api/lifesatisfaction");
}