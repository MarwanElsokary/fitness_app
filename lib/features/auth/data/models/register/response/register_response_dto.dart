import 'package:fitness_app/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../user_dto.dart';

part 'register_response_dto.g.dart';

@JsonSerializable()
class RegisterResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  RegisterResponseDto({this.message, this.user, this.token});

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterResponseDtoToJson(this);
  }

  RegisterResponseEntity toEntity() {
    return RegisterResponseEntity(
      message: message,
      user: user?.toEntity(),
      token: token,
    );
  }
}
