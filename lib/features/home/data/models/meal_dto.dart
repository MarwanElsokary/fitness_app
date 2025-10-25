import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_dto.g.dart';

@JsonSerializable()
class MealDto {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  MealDto({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory MealDto.fromJson(Map<String, dynamic> json) =>
      _$MealDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealDtoToJson(this);

  MealEntity toEntity() {
    return MealEntity(
      idCategory: idCategory,
      name: strCategory,
      imageUrl: strCategoryThumb,
      strCategoryDescription: strCategoryDescription,
    );
  }
}
