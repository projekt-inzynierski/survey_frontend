import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/occupation_category_service.dart';
import 'package:survey_frontend/domain/models/occupation_category_dto.dart';

class OccupatiuonCategoryServiceImpl extends APIServiceBase implements OccupationCategoryService {
  OccupatiuonCategoryServiceImpl(super.dio);

  @override
  Future<APIResponse<List<OccupationCategoryDto>>> getOccupationCategories() => get<List<OccupationCategoryDto>>('/api/occupationcategories');
}