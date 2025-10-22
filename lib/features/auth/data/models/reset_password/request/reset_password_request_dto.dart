import 'package:fitness_app/features/auth/domain/entities/reset_password/request/reset_password_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  final String email;
  final String newPassword;

  ResetPasswordRequestDto({required this.email, required this.newPassword});

  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);

  factory ResetPasswordRequestDto.fromDomain(
    ResetPasswordRequestEntity entity,
  ) => ResetPasswordRequestDto(
    email: entity.email,
    newPassword: entity.newPassword,
  );
}
