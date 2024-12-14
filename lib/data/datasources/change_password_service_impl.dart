import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/change_password_service.dart';
import 'package:survey_frontend/domain/models/change_password_dto.dart';

class ChangePasswordServiceImpl extends APIServiceBase implements ChangePasswordService {
  final GetStorage storage;
  
  ChangePasswordServiceImpl(super.dio, {required super.tokenProvider, required this.storage});

  @override
  Future<APIResponse> changePassword(ChangePasswordDto dto) {
    final respondentId = storage.read<Map<String, dynamic>>('respondentData')!['id'];

    return patch('/api/respondents/${respondentId!}/password', dto.toJson());
  }

}