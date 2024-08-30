import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/models/need_insert_respondent_data_result.dart';
import 'package:survey_frontend/core/usecases/need_insert_respondent_data_usecase.dart';
import 'package:survey_frontend/domain/external_services/respondent_date_service.dart';

class NeedInsertRespondentDataUseCaseImpl implements NeedInsertRespondentDataUseCase{
  final RespondentDataService _respondentDataService;
  final GetStorage _storage;

  NeedInsertRespondentDataUseCaseImpl(this._respondentDataService, this._storage);

  @override
  Future<NeedInsertRespondentDataResult> needInsertRespondentData() async {
       var respondentDataApiResponse =
       await _respondentDataService.getRespondentData();

      if (respondentDataApiResponse.error != null) {
        return NeedInsertRespondentDataResult.error;
      }

      if (respondentDataApiResponse.statusCode == 404) {
        return NeedInsertRespondentDataResult.need;
      }

      if (respondentDataApiResponse.statusCode == 200){
        await _storage.write('respondentData', respondentDataApiResponse.body);
        return NeedInsertRespondentDataResult.noNeed;
      }

      return NeedInsertRespondentDataResult.error;
  }
}