import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/short_survey_service.dart';
import 'package:survey_frontend/domain/models/short_survey_dto.dart';

class ShortSurveyServiceImpl extends APIServiceBase
    implements ShortSurveyService {
  ShortSurveyServiceImpl(super.dio);

  // Mocked Data
  // @override
  // Future<APIResponse<List<ShortSurveyDto>>> getShortSurvey() async {
  //   final jsonString =
  //       await rootBundle.loadString("assets/mocked/pending_survey.json");
  //   final List<dynamic> json = jsonDecode(jsonString);

  //   final List<ShortSurveyDto> items =
  //       json.map<ShortSurveyDto>((e) => ShortSurveyDto.fromJson(e)).toList();

  //   return APIResponse(body: items);
  // }

  @override
  Future<APIResponse<List<ShortSurveyDto>>> getShortSurvey() =>
      get<List<ShortSurveyDto>>(
          '/api/surveys/short',
          (dynamic items) => items
              .map<ShortSurveyDto>((e) => ShortSurveyDto.fromJson(e))
              .toList());
}