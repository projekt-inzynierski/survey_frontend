import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/education_category_service.dart';
import 'package:survey_frontend/domain/models/education_category_dto.dart';

class EducationCategoryServiceImpl extends APIServiceBase implements EducationCategoryService{
  EducationCategoryServiceImpl(super.dio);

  @override
  Future<APIResponse<List<EducationCategoryDto>>> getEducationCategories() => get<List<EducationCategoryDto>>('/api/educationcategories');
}