import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/localization_data.dart';

abstract class LocalizationService {
  Future<APIResponse> submitLocation(String id, LocalizationData location);
  Future<APIResponse> submitLocations(List<LocalizationData> locations);
}
