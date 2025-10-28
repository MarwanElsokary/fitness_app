// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutResponse _$WorkoutResponseFromJson(Map<String, dynamic> json) =>
    WorkoutResponse(
      message: json['message'] as String?,
      musclesGroup: (json['musclesGroup'] as List<dynamic>?)
          ?.map((e) => MusclesGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutResponseToJson(WorkoutResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'musclesGroup': instance.musclesGroup,
    };

MusclesGroup _$MusclesGroupFromJson(Map<String, dynamic> json) =>
    MusclesGroup(id: json['_id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$MusclesGroupToJson(MusclesGroup instance) =>
    <String, dynamic>{'_id': instance.id, 'name': instance.name};
