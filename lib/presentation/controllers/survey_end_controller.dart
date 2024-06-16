import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/survey_response_service.dart';
import 'package:survey_frontend/domain/models/create_survey_resopnse_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class SurveyEndController extends ControllerBase{
  late CreateSurveyResponseDto dto;
  final SurveyResponseService _service;
  bool _isBusy = false;

  SurveyEndController(this._service);

  void endSurvey() async{
    if (_isBusy){
      return;
    }

    try{
      _isBusy = true;
      if (!(await _submitToServer())){
        popup('Błąd', 'Nie udało się przesłać odpowiedzi');
      }

      Get.offAllNamed(
      "/home",
      );
    } catch (e){
      popup('Błąd', 'Pomyślnie przesłano odpowiedź na serwer, ale wystąpił błąd podczas powrotu na stronę główną. Spróbuj ponownie uruchomić aplikację.');
    } finally{
      _isBusy = false;
    }
  }

  Future<bool> _submitToServer() async{
    try{
      final apiResponse = await _service.submitResponse(dto);
      return apiResponse.error != null && apiResponse.statusCode == 201;
    } catch (e){
      //TODO: log the error
      return false;
    }
  }

  void readGetArgs(){
    dto = Get.arguments['responseModel'];
  }
}