import 'package:json_annotation/json_annotation.dart';

import 'meal_dto.dart';

part 'recommendation_meals_dto.g.dart';

@JsonSerializable()
class RecommendationMealsDto {
  @JsonKey(name: 'categories')
  final List<MealDto> meals;

  RecommendationMealsDto({required this.meals});

  factory RecommendationMealsDto.fromJson(Map<String, dynamic> json) =>
      _$RecommendationMealsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationMealsDtoToJson(this);
}
