// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseDto _$ResetPasswordResponseDtoFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponseDto(
  message: json['message'] as String?,
  error: json['error'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$ResetPasswordResponseDtoToJson(
  ResetPasswordResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'error': instance.error,
  'token': instance.token,
};
