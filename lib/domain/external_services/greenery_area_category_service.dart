import 'package:survey_frontend/domain/models/greenery_area_category_dto.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';

abstract class GreeneryAreaCategoryService{
  Future<APIResponse<List<GreeneryAreaCategoryDto>>> getCategories();
}