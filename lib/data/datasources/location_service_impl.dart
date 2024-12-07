import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/location_service.dart';
import 'package:survey_frontend/domain/models/localization_data.dart';

class LocalizationServiceImpl extends APIServiceBase
    implements LocalizationService {
  LocalizationServiceImpl(super.dio);

  @override
  Future<APIResponse<String>> submitLocation(
      String id, LocalizationData location) {
    return postMany<String>('/api/localization', [
      {
        'surveyParticipationId': id,
        ...location.toJson(),
      }
    ]);
  }
}
