// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerificationResponseDto _$OtpVerificationResponseDtoFromJson(
  Map<String, dynamic> json,
) => OtpVerificationResponseDto(
  error: json['error'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$OtpVerificationResponseDtoToJson(
  OtpVerificationResponseDto instance,
) => <String, dynamic>{'error': instance.error, 'status': instance.status};
