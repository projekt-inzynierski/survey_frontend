import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/domain/local_services/survey_participation_service.dart';
import 'package:survey_frontend/domain/models/survey_participation_dto.dart';

class SurveyParticipationServiceImpl implements SurveyParticipationService {
  final GetStorage _localStorage;

  SurveyParticipationServiceImpl(this._localStorage);

  //TODO: this is not the best storage way imo, maybe we should use Sqlite db for this?
  //or maybe this is good?
  @override
  Future<void> addParticipation(SurveyParticipationDto dto) async {
    final participations = await getAllParticipations();

    participations.add(dto);
    await _localStorage.write('participations', participations);
  }

  @override
  Future<List<SurveyParticipationDto>> getAllParticipations() {
    return Future.value(_localStorage
            .read<List<dynamic>>('participations')
            ?.map((e) => SurveyParticipationDto.fromJson(e))
            .toList() ??
        <SurveyParticipationDto>[]);
  }
}
