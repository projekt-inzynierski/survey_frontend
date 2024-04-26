import 'package:json_annotation/json_annotation.dart';

part 'respondent_data_dto.g.dart';

@JsonSerializable()
class RespondentDataDto{
  String id;
  String identityUserId;
  String gender;
  int ageCategoryId;
  int occupationCategoryId;
  int educationCategoryId;
  int greeneryAreaCategoryId;
  int medicationUseCategoryId;
  int healthConditionCategoryId;
  int stressLevelCategoryId;
  int lifeSatisfactionCategoryId;
  int qualityOfSleepCategoryId;

  RespondentDataDto(this.id, this.identityUserId, this.gender, this.ageCategoryId, this.occupationCategoryId,
  this.educationCategoryId, this.greeneryAreaCategoryId, this.medicationUseCategoryId,
  this.healthConditionCategoryId, this.stressLevelCategoryId, this.lifeSatisfactionCategoryId,
  this.qualityOfSleepCategoryId);

  factory RespondentDataDto.fromJson(Map<String, dynamic> json) => _$RespondentDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RespondentDataDtoToJson(this);
}