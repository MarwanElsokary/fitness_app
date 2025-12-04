class GetExerciseEntity {
  final String? message;
  final int? totalExercises;
  final int? totalPages;
  final int? currentPage;
  final List<ExercisesEntity>? exercises;

  GetExerciseEntity({
    this.message,
    this.totalExercises,
    this.totalPages,
    this.currentPage,
    this.exercises,
  });
}

class ExercisesEntity {
  final String? id;
  final String? exercise;
  final dynamic shortYoutubeDemonstration;
  final dynamic inDepthYoutubeExplanation;
  final String? difficultyLevel;
  final String? targetMuscleGroup;
  final String? primeMoverMuscle;
  final String? primaryEquipment;
  final int? primaryItems;
  final dynamic secondaryEquipment;
  final int? secondaryItems;
  final String? posture;
  final String? singleOrDoubleArm;
  final String? continuousOrAlternatingArms;
  final String? grip;
  final String? loadPositionEnding;
  final String? continuousOrAlternatingLegs;
  final String? footElevation;
  final String? combinationExercises;
  final String? movementPattern1;
  final String? movementPattern2;
  final dynamic movementPattern3;
  final String? planeOfMotion1;
  final dynamic planeOfMotion2;
  final dynamic planeOfMotion3;
  final String? bodyRegion;
  final String? forceType;
  final String? mechanics;
  final String? laterality;
  final String? primaryExerciseClassification;
  final dynamic shortYoutubeDemonstrationLink;
  final dynamic inDepthYoutubeExplanationLink;

  ExercisesEntity({
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
}
