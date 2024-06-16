import 'package:json_annotation/json_annotation.dart';

part 'time_slot_dto.g.dart';

@JsonSerializable()
class TimeSlotDto {
  String id;
  DateTime start;
  DateTime finish;

  TimeSlotDto({required this.id, required this.start, required this.finish});

  factory TimeSlotDto.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSlotDtoToJson(this);
}
