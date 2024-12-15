import 'package:json_annotation/json_annotation.dart';

part 'localization_data.g.dart';

@JsonSerializable()
class LocalizationData {
  final String dateTime;
  final double latitude;
  final double longitude;

  LocalizationData({
    required this.dateTime,
    required this.latitude,
    required this.longitude,
  });

  factory LocalizationData.fromJson(Map<String, dynamic> json) =>
      _$LocalizationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizationDataToJson(this);
}