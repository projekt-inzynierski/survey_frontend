
import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto{
  String? username;
  String? password;

  LoginDto({this.username, this.password});

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}