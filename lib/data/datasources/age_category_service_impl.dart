import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/age_category_service.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';

class AgeCategoryServiceImpl extends APIServiceBase implements AgeCategoryService {
  AgeCategoryServiceImpl(super.dio);

  @override
  Future<APIResponse<List<AgeCategoryDto>>> getAgeCategories() => get<List<AgeCategoryDto>>('/api/agecategories');
}