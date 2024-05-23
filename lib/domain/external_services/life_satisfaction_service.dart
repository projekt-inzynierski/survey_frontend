import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/life_satisfaction_dto.dart';

abstract class LifeSatisfactionService {
  Future<APIResponse<List<LifeSatisfactionDto>>> getLifeSatisfactions();
}