import 'package:json_annotation/json_annotation.dart';

import '../../../../features/exercise/domain/entites/all_difficulty_level_by_prime_muscle_entity.dart';

part 'all_difficulty_level_by_prime_muscle_response.g.dart';

@JsonSerializable()
class AllDifficultyLevelByPrimeMuscleResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalLevels")
  final int? totalLevels;
  @JsonKey(name: "difficulty_levels")
  final List<DifficultyLevelsDto>? difficultyLevels;

  AllDifficultyLevelByPrimeMuscleResponse({
    this.message,
    this.totalLevels,
    this.difficultyLevels,
  });

  factory AllDifficultyLevelByPrimeMuscleResponse.fromJson(
      Map<String, dynamic> json) {
    return _$AllDifficultyLevelByPrimeMuscleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllDifficultyLevelByPrimeMuscleResponseToJson(this);
  }
}

@JsonSerializable()
class DifficultyLevelsDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  DifficultyLevelsDto({
    this.id,
    this.name,
  });

  factory DifficultyLevelsDto.fromJson(Map<String, dynamic> json) {
    return _$DifficultyLevelsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DifficultyLevelsDtoToJson(this);
  }

  DifficultyLevelsEntity toEntity() {
    return DifficultyLevelsEntity(
        name: name,
        id: id
    );
  }
}