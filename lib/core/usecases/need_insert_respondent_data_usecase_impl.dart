import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/models/need_insert_respondent_data_result.dart';
import 'package:survey_frontend/core/usecases/need_insert_respondent_data_usecase.dart';
import 'package:survey_frontend/domain/external_services/initial_survey_service.dart';
import 'package:survey_frontend/domain/external_services/respondent_date_service.dart';

class NeedInsertRespondentDataUseCaseImpl implements NeedInsertRespondentDataUseCase{
  final InitialSurveyService _respondentDataService;
  final GetStorage _storage;

  NeedInsertRespondentDataUseCaseImpl(this._respondentDataService, this._storage);

  @override
  Future<NeedInsertRespondentDataResult> needInsertRespondentData() async {

      var respondentData = _storage.read("respondentData");

      if (respondentData != null) {
          return NeedInsertRespondentDataResult.noNeed;
      }

      var respondentDataApiResponse =
      await _respondentDataService.getMyResponse();

      if (respondentDataApiResponse.statusCode == 200){
        await _storage.write('respondentData', respondentDataApiResponse.body);
        return NeedInsertRespondentDataResult.noNeed;
      }


      if (respondentDataApiResponse.error != null ||
         (respondentDataApiResponse.statusCode != 200 && respondentDataApiResponse.statusCode != 404)){
        return NeedInsertRespondentDataResult.error;
      }
      
      final surveyResult = await _respondentDataService.getInitialSurvey();

      if (surveyResult.error != null ||
         (surveyResult.statusCode != 200 && surveyResult.statusCode != 404)){
          return NeedInsertRespondentDataResult.error;
      }

      if (surveyResult.statusCode == 404 || surveyResult.body!.isEmpty){
        return NeedInsertRespondentDataResult.noNeed;
      }

      return NeedInsertRespondentDataResult.need; 
  }
}