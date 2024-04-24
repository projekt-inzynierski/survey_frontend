import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/greenery_area_category_service.dart';
import 'package:survey_frontend/domain/models/greenery_area_category_dto.dart';

class GreeneryAreaCategoryServiceImpl extends APIServiceBase implements GreeneryAreaCategoryService{
  GreeneryAreaCategoryServiceImpl(super.dio);

  @override
  Future<APIResponse<List<GreeneryAreaCategoryDto>>> getCategories() => get<List<GreeneryAreaCategoryDto>>('/api/greeneryareacategories');

}