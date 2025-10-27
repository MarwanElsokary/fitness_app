import 'package:fitness_app/features/home/data/models/exercise_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_recommendation_exercise_dto.g.dart';

@JsonSerializable()
class DailyRecommendationExerciseDto {
  String? message;
  int? totalExercises;
  List<ExerciseDto>? exercises;

  DailyRecommendationExerciseDto({
    this.message,
    this.totalExercises,
    this.exercises,
  });

  factory DailyRecommendationExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$DailyRecommendationExerciseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DailyRecommendationExerciseDtoToJson(this);
}
