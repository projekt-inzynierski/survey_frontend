import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/medication_use_dto.dart';

abstract class MedicationUseService {
  Future<APIResponse<List<MedicationUseDto>>> getMedicationUses();
}