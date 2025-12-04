import 'package:fitness_app/features/auth/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  final String? message;
  final String? error;
  final String? token;

  ResetPasswordResponseDto({this.message, this.error, this.token});

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseDtoToJson(this);

  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(message: message, error: error);
  }
}
