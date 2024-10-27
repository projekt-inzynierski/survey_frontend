import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/respondent_group_service.dart';
import 'package:survey_frontend/domain/models/respondent_group_dto.dart';

class RespondentGroupServiceImpl extends APIServiceBase
    implements RespondentGroupService {
  RespondentGroupServiceImpl(super.dio);

  @override
  Future<APIResponse<List<RespondentGroupDto>>> getAllForRespondent(
      String respondentId) {
    return get<List<RespondentGroupDto>>(
        '/api/respondentgroups?respondentId=$respondentId',
        (dynamic items) => items
            .map<RespondentGroupDto>((e) => RespondentGroupDto.fromJson(e))
            .toList());
  }
}
