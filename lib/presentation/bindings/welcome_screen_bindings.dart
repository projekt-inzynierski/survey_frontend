import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/age_category_service_impl.dart';
import 'package:survey_frontend/data/datasources/education_category_service_impl.dart';
import 'package:survey_frontend/data/datasources/greenery_area_category_service_impl.dart';
import 'package:survey_frontend/data/datasources/occupation_category_service_impl.dart';
import 'package:survey_frontend/domain/external_services/age_category_service.dart';
import 'package:survey_frontend/domain/external_services/education_category_service.dart';
import 'package:survey_frontend/domain/external_services/greenery_area_category_service.dart';
import 'package:survey_frontend/domain/external_services/occupation_category_service.dart';
import 'package:survey_frontend/presentation/controllers/welcome_screen_controller.dart';

class WelcomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgeCategoryService>(() => AgeCategoryServiceImpl(Get.find()));
    Get.lazyPut<OccupationCategoryService>(() => OccupationCategoryServiceImpl(Get.find()));
    Get.lazyPut<EducationCategoryService>(() => EducationCategoryServiceImpl(Get.find()));
    Get.lazyPut<GreeneryAreaCategoryService>(() => GreeneryAreaCategoryServiceImpl(Get.find()));
    Get.lazyPut(() => WelcomeScreenController());
  }
}