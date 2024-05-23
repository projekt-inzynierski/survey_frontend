import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/education_category_dto.dart';

abstract class EducationCategoryService{
  Future<APIResponse<List<EducationCategoryDto>>> getEducationCategories();
}