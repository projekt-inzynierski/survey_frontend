import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/quality_of_sleep_service.dart';
import 'package:survey_frontend/domain/models/quality_of_sleep_dto.dart';

class QualityOfSleepServiceImpl extends APIServiceBase implements QualityOfSleepService {
  QualityOfSleepServiceImpl(super.dio);

  @override
  Future<APIResponse<List<QualityOfSleepDto>>> getQualityOfSleeps() => get<List<QualityOfSleepDto>>('/api/qualityofsleep');
}