// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_by_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesByGroupResponse _$MusclesByGroupResponseFromJson(
  Map<String, dynamic> json,
) => MusclesByGroupResponse(
  json['message'] as String,
  MuscleGroupDto.fromJson(json['muscleGroup'] as Map<String, dynamic>),
  (json['muscles'] as List<dynamic>)
      .map((e) => MuscleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MusclesByGroupResponseToJson(
  MusclesByGroupResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'muscleGroup': instance.muscleGroup,
  'muscles': instance.muscles,
};
