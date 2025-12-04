import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_exercise_response.g.dart';

@JsonSerializable()
class GetExerciseResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalExercises")
  final int? totalExercises;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "exercises")
  final List<Exercises>? exercises;

  GetExerciseResponse({
    this.message,
    this.totalExercises,
    this.totalPages,
    this.currentPage,
    this.exercises,
  });

  factory GetExerciseResponse.fromJson(Map<String, dynamic> json) {
    return _$GetExerciseResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetExerciseResponseToJson(this);
  }
}

@JsonSerializable()
class Exercises {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "exercise")
  final String? exercise;
  @JsonKey(name: "short_youtube_demonstration")
  final dynamic shortYoutubeDemonstration;
  @JsonKey(name: "in_depth_youtube_explanation")
  final dynamic inDepthYoutubeExplanation;
  @JsonKey(name: "difficulty_level")
  final String? difficultyLevel;
  @JsonKey(name: "target_muscle_group")
  final String? targetMuscleGroup;
  @JsonKey(name: "prime_mover_muscle")
  final String? primeMoverMuscle;
  @JsonKey(name: "primary_equipment")
  final String? primaryEquipment;
  @JsonKey(name: "_primary_items")
  final int? primaryItems;
  @JsonKey(name: "secondary_equipment")
  final dynamic secondaryEquipment;
  @JsonKey(name: "_secondary_items")
  final int? secondaryItems;
  @JsonKey(name: "posture")
  final String? posture;
  @JsonKey(name: "single_or_double_arm")
  final String? singleOrDoubleArm;
  @JsonKey(name: "continuous_or_alternating_arms")
  final String? continuousOrAlternatingArms;
  @JsonKey(name: "grip")
  final String? grip;
  @JsonKey(name: "load_position_ending")
  final String? loadPositionEnding;
  @JsonKey(name: "continuous_or_alternating_legs")
  final String? continuousOrAlternatingLegs;
  @JsonKey(name: "foot_elevation")
  final String? footElevation;
  @JsonKey(name: "combination_exercises")
  final String? combinationExercises;
  @JsonKey(name: "movement_pattern_1")
  final String? movementPattern1;
  @JsonKey(name: "movement_pattern_2")
  final String? movementPattern2;
  @JsonKey(name: "movement_pattern_3")
  final dynamic movementPattern3;
  @JsonKey(name: "plane_of_motion_1")
  final String? planeOfMotion1;
  @JsonKey(name: "plane_of_motion_2")
  final dynamic planeOfMotion2;
  @JsonKey(name: "plane_of_motion_3")
  final dynamic planeOfMotion3;
  @JsonKey(name: "body_region")
  final String? bodyRegion;
  @JsonKey(name: "force_type")
  final String? forceType;
  @JsonKey(name: "mechanics")
  final String? mechanics;
  @JsonKey(name: "laterality")
  final String? laterality;
  @JsonKey(name: "primary_exercise_classification")
  final String? primaryExerciseClassification;
  @JsonKey(name: "short_youtube_demonstration_link")
  final dynamic shortYoutubeDemonstrationLink;
  @JsonKey(name: "in_depth_youtube_explanation_link")
  final dynamic inDepthYoutubeExplanationLink;

  Exercises({
    this.id,
    this.exercise,
    this.shortYoutubeDemonstration,
    this.inDepthYoutubeExplanation,
    this.difficultyLevel,
    this.targetMuscleGroup,
    this.primeMoverMuscle,
    this.primaryEquipment,
    this.primaryItems,
    this.secondaryEquipment,
    this.secondaryItems,
    this.posture,
    this.singleOrDoubleArm,
    this.continuousOrAlternatingArms,
    this.grip,
    this.loadPositionEnding,
    this.continuousOrAlternatingLegs,
    this.footElevation,
    this.combinationExercises,
    this.movementPattern1,
    this.movementPattern2,
    this.movementPattern3,
    this.planeOfMotion1,
    this.planeOfMotion2,
    this.planeOfMotion3,
    this.bodyRegion,
    this.forceType,
    this.mechanics,
    this.laterality,
    this.primaryExerciseClassification,
    this.shortYoutubeDemonstrationLink,
    this.inDepthYoutubeExplanationLink,
  });

  factory Exercises.fromJson(Map<String, dynamic> json) {
    return _$ExercisesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExercisesToJson(this);
  }

  ExercisesEntity toEntity() {
    return ExercisesEntity(
      id: id,
      bodyRegion: bodyRegion,
      combinationExercises: combinationExercises,
      continuousOrAlternatingArms: continuousOrAlternatingArms,
      continuousOrAlternatingLegs: continuousOrAlternatingLegs,
      difficultyLevel: difficultyLevel,
      exercise: exercise,
      footElevation: footElevation,
      forceType: forceType,
      grip: grip,
      inDepthYoutubeExplanation: inDepthYoutubeExplanation,
      inDepthYoutubeExplanationLink: inDepthYoutubeExplanationLink,
      laterality: laterality,
      loadPositionEnding: loadPositionEnding,
      mechanics: mechanics,
      movementPattern1: movementPattern1,
      movementPattern2: movementPattern2,
      movementPattern3: movementPattern3,
      planeOfMotion1: planeOfMotion1,
      planeOfMotion2: planeOfMotion2,
      planeOfMotion3: planeOfMotion3,
      posture: posture,
      primaryEquipment: primaryEquipment,
      primaryExerciseClassification: primaryExerciseClassification,
      primaryItems: primaryItems,
      primeMoverMuscle: primeMoverMuscle,
      secondaryEquipment: secondaryEquipment,
      secondaryItems: secondaryItems,
      shortYoutubeDemonstration: shortYoutubeDemonstration,
      shortYoutubeDemonstrationLink: shortYoutubeDemonstrationLink,
      singleOrDoubleArm: singleOrDoubleArm,
      targetMuscleGroup: targetMuscleGroup,
    );
  }
}
