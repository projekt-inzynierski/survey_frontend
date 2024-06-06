import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';

class SurveyServiceImpl extends APIServiceBase implements SurveyService {
  SurveyServiceImpl(super.dio);

  @override
  Future<APIResponse<SurveyDto>> getSurvey(String surveyID) async {
    final jsonString = await rootBundle.loadString(surveyID);
    final json = jsonDecode(jsonString);
    final items = SurveyDto.fromJson(json);
    
    return Future.value(APIResponse(body: items));
  }

  // TODO: implement getSurvey from API
  // @override
  // Future<APIResponse<List<SurveyDto>>> getSurvey() => get<List<SurveyDto>>(
  //     '/api/survey',
  //     (dynamic items) =>
  //         items.map<SurveyDto>((e) => SurveyDto.fromJson(e)).toList());
}
