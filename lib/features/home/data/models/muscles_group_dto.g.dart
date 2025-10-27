// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesGroupDto _$MusclesGroupDtoFromJson(Map<String, dynamic> json) =>
    MusclesGroupDto(
      json['message'] as String?,
      (json['musclesGroup'] as List<dynamic>?)
          ?.map((e) => MuscleGroupDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MusclesGroupDtoToJson(MusclesGroupDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'musclesGroup': instance.musclesGroup,
    };
