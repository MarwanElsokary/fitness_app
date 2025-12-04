// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_difficulty_level_by_prime_muscle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDifficultyLevelByPrimeMuscleResponse
_$AllDifficultyLevelByPrimeMuscleResponseFromJson(Map<String, dynamic> json) =>
    AllDifficultyLevelByPrimeMuscleResponse(
      message: json['message'] as String?,
      totalLevels: (json['totalLevels'] as num?)?.toInt(),
      difficultyLevels: (json['difficulty_levels'] as List<dynamic>?)
          ?.map((e) => DifficultyLevelsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllDifficultyLevelByPrimeMuscleResponseToJson(
  AllDifficultyLevelByPrimeMuscleResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'totalLevels': instance.totalLevels,
  'difficulty_levels': instance.difficultyLevels,
};

DifficultyLevelsDto _$DifficultyLevelsDtoFromJson(Map<String, dynamic> json) =>
    DifficultyLevelsDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DifficultyLevelsDtoToJson(
  DifficultyLevelsDto instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
