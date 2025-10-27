part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BaseState? getDailyRecommendationExerciseState;
  final BaseState? getFoodRecommendationState;
  final BaseState? getExerciseCategoriesState;
  final BaseState? getAllMuscelsState;
  final BaseState? getMusclesByGroupState;

  const HomeState({
    this.getDailyRecommendationExerciseState,
    this.getFoodRecommendationState,
    this.getExerciseCategoriesState,
    this.getAllMuscelsState,
    this.getMusclesByGroupState,
  });

  HomeState copyWith({
    BaseState? getDailyRecommendationExerciseState,
    BaseState? getFoodRecommendationState,
    BaseState? getExerciseCategoriesState,
    BaseState? getAllMuscelsState,
    BaseState? getMusclesByGroupState,
  }) {
    return HomeState(
      getDailyRecommendationExerciseState:
          getDailyRecommendationExerciseState ??
          this.getDailyRecommendationExerciseState,
      getFoodRecommendationState:
          getFoodRecommendationState ?? this.getFoodRecommendationState,
      getExerciseCategoriesState:
          getExerciseCategoriesState ?? this.getExerciseCategoriesState,
      getAllMuscelsState: getAllMuscelsState ?? this.getAllMuscelsState,
      getMusclesByGroupState:
          getMusclesByGroupState ?? this.getMusclesByGroupState,
    );
  }

  @override
  List<Object?> get props => [
    getDailyRecommendationExerciseState,
    getFoodRecommendationState,
    getExerciseCategoriesState,
    getAllMuscelsState,
    getMusclesByGroupState,
  ];
}

sealed class HomeAction {}

final class GetDailyRecommendationExerciseAction extends HomeAction {}

final class GetFoodRecommendationAction extends HomeAction {}

final class GetExerciseCategoriesAction extends HomeAction {}

final class GetAllMuscelsAction extends HomeAction {}

final class GetMusclesByGroupAction extends HomeAction {}
