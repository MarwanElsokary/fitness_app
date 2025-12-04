// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_meals_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationMealsDto _$RecommendationMealsDtoFromJson(
  Map<String, dynamic> json,
) => RecommendationMealsDto(
  meals: (json['categories'] as List<dynamic>)
      .map((e) => MealDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecommendationMealsDtoToJson(
  RecommendationMealsDto instance,
) => <String, dynamic>{'categories': instance.meals};
