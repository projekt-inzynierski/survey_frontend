import 'package:json_annotation/json_annotation.dart';

part 'create_respondent_data_dto.g.dart';

@JsonSerializable()
class CreateRespondentDataDto{
  String? gender;
  int? ageCategoryId;
  int? occupationCategoryId;
  int? educationCategoryId;
  int? greeneryAreaCategoryId;
  int? medicationUseCategoryId;
  int? healthConditionCategoryId;
  int? stressLevelCategoryId;
  int? lifeSatisfactionCategoryId;
  int? qualityOfSleepCategoryId;

  CreateRespondentDataDto({this.gender, this.ageCategoryId, this.occupationCategoryId,
  this.educationCategoryId, this.greeneryAreaCategoryId, this.medicationUseCategoryId,
  this.healthConditionCategoryId, this.stressLevelCategoryId, this.lifeSatisfactionCategoryId,
  this.qualityOfSleepCategoryId});

  factory CreateRespondentDataDto.fromJson(Map<String, dynamic> json) => _$CreateRespondentDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateRespondentDataDtoToJson(this);
}