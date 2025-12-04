// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_recommendation_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyRecommendationExerciseDto _$DailyRecommendationExerciseDtoFromJson(
  Map<String, dynamic> json,
) => DailyRecommendationExerciseDto(
  message: json['message'] as String?,
  totalExercises: (json['totalExercises'] as num?)?.toInt(),
  exercises: (json['exercises'] as List<dynamic>?)
      ?.map((e) => ExerciseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DailyRecommendationExerciseDtoToJson(
  DailyRecommendationExerciseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'totalExercises': instance.totalExercises,
  'exercises': instance.exercises,
};
