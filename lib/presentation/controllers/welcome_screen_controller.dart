import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/age_category_service.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/education_category_service.dart';
import 'package:survey_frontend/domain/external_services/greenery_area_category_service.dart';
import 'package:survey_frontend/domain/external_services/occupation_category_service.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';
import 'package:survey_frontend/domain/models/create_respondent_data_dto.dart';
import 'package:survey_frontend/domain/models/education_category_dto.dart';
import 'package:survey_frontend/domain/models/greenery_area_category_dto.dart';
import 'package:survey_frontend/domain/models/occupation_category_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class WelcomeScreenConroller extends ControllerBase {
  final AgeCategoryService _ageCategoryService;
  final OccupationCategoryService _occupationCategoryService;
  final EducationCategoryService _educationCategoryService;
  final GreeneryAreaCategoryService _greeneryAreaCategoryService;

  final CreateRespondentDataDto _dto = CreateRespondentDataDto();

  WelcomeScreenConroller(this._ageCategoryService, 
  this._occupationCategoryService, 
  this._educationCategoryService,
  this._greeneryAreaCategoryService);

  void letsGo() async{
    Future<APIResponse<List<AgeCategoryDto>>> ageCategoriesFuture = _ageCategoryService.getAgeCategories();
    Future<APIResponse<List<EducationCategoryDto>>> educationCategoriesFuture = _educationCategoryService.getEducationCategories();
    Future<APIResponse<List<OccupationCategoryDto>>> occupationCategoriesFuture = _occupationCategoryService.getOccupationCategories();
    Future<APIResponse<List<GreeneryAreaCategoryDto>>> greeneryAreaCategoriesFuture = _greeneryAreaCategoryService.getCategories();

    await Future.wait([
      ageCategoriesFuture,
      educationCategoriesFuture, 
      occupationCategoriesFuture,
      greeneryAreaCategoriesFuture]);

    APIResponse<List<AgeCategoryDto>> ageCategoriesResult = await ageCategoriesFuture;
    APIResponse<List<EducationCategoryDto>> educationCategoriesResult = await educationCategoriesFuture;
    APIResponse<List<OccupationCategoryDto>> occupationCategoriesResult = await occupationCategoriesFuture;
    APIResponse<List<GreeneryAreaCategoryDto>> greeneryAreaCategoriesResult = await greeneryAreaCategoriesFuture;

    if (ageCategoriesResult.error != null || ageCategoriesResult.statusCode != 200
    || educationCategoriesResult.error != null || educationCategoriesResult.statusCode != 200
    || occupationCategoriesResult.error != null || occupationCategoriesResult.statusCode != 200
    || greeneryAreaCategoriesResult.error != null || greeneryAreaCategoriesResult.statusCode != 200) {
      await handleSomethingWentWrong(null);
      return;
    }

    Get.toNamed('/insertdemograficinformation', arguments: {
      'dto' : _dto,
      'ageCategories': ageCategoriesResult.body!,
      'educationCategories': educationCategoriesResult.body!,
      'occupationCategories': occupationCategoriesResult.body!,
      'greeneryAreaCategories': greeneryAreaCategoriesResult.body!
    });
  }
}