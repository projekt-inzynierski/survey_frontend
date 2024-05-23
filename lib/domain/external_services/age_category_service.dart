import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';

abstract class AgeCategoryService{
  Future<APIResponse<List<AgeCategoryDto>>> getAgeCategories();
}