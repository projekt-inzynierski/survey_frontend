import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/occupation_category_dto.dart';

abstract class OccupationCategoryService {
  Future<APIResponse<List<OccupationCategoryDto>>> getOccupationCategories();
}