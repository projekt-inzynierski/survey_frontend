import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/medication_use_service.dart';
import 'package:survey_frontend/domain/models/medication_use_dto.dart';

class MedicationUseServiceImpl extends APIServiceBase implements MedicationUseService{
  MedicationUseServiceImpl(super.dio);

  @override
  Future<APIResponse<List<MedicationUseDto>>> getMedicationUses() => get<List<MedicationUseDto>>('/api/medicationuse');
}