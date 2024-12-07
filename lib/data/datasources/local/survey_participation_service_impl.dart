import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/domain/local_services/survey_participation_service.dart';
import 'package:survey_frontend/domain/models/survey_participation_dto.dart';

class SurveyParticipationServiceImpl implements SurveyParticipationService {
  final GetStorage _localStorage;

  SurveyParticipationServiceImpl(this._localStorage);

  @override
  Future<void> addParticipation(SurveyParticipationDto dto) async {
    final participations = await getAllParticipates();

    participations.add(dto);
    await _localStorage.write('participations', participations);
  }

  @override
  Future<List<SurveyParticipationDto>> getAllParticipates() {
    return Future.value(
        _localStorage.read<List<dynamic>>('participations')?.map((e) {
              if (e is SurveyParticipationDto) {
                return e;
              }
              return SurveyParticipationDto.fromJson(e);
            }).toList() ??
            <SurveyParticipationDto>[]);
  }
}
