import 'package:fitness_app/features/auth/domain/entities/otp_verification/request/otp_verification_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_verification_request_dto.g.dart';

@JsonSerializable()
class OtpVerificationRequestDto {
  final String resetCode;

  OtpVerificationRequestDto({required this.resetCode});

  factory OtpVerificationRequestDto.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OtpVerificationRequestDtoToJson(this);

  factory OtpVerificationRequestDto.fromDomain(
    OtpVerificationRequestEntity entity,
  ) {
    return OtpVerificationRequestDto(resetCode: entity.resetCode);
  }
}
