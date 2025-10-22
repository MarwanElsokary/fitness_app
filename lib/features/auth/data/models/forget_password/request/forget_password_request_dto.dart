import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  final String email;

  ForgetPasswordRequestDto({required this.email});

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);

  factory ForgetPasswordRequestDto.fromDomain(
    ForgetPasswordRequestEntity entity,
  ) {
    return ForgetPasswordRequestDto(email: entity.email);
  }
}
