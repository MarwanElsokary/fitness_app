import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/resources/app_constants.dart';
import 'package:fitness_app/features/home/domain/entities/category_entity.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/home/domain/usecases/get_all_muscles_use_case.dart';
import 'package:fitness_app/features/home/domain/usecases/get_daily_recommendation_exercise_use_case.dart';
import 'package:fitness_app/features/home/domain/usecases/get_food_recommendation_use_case.dart';
import 'package:fitness_app/features/home/domain/usecases/get_muscles_by_group_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetDailyRecommendationExerciseUseCase
  _getDailyRecommendationExerciseUseCase;
  final GetFoodRecommendationUseCase _getFoodRecommendationUseCase;
  final GetAllMusclesUseCase _getAllMusclesUseCase;
  final GetMusclesByGroupUseCase _getAllMusclesByGroupUseCase;

  HomeCubit(
    this._getDailyRecommendationExerciseUseCase,
    this._getFoodRecommendationUseCase,
    this._getAllMusclesUseCase,
    this._getAllMusclesByGroupUseCase,
  ) : super(const HomeState());

  late List<CategoryEntity> exerciseCategories = [];
  late List<ExerciseEntity> dailyRecommendation = [];
  late List<MealEntity> foodRecommendation = [];
  late List<MuscleGroupEntity> muscleGroups = [];
  late List<MuscleEntity> muscles = [];

  Future<void> doIntent(HomeAction action) async {
    switch (action) {
      case GetDailyRecommendationExerciseAction():
        {
          _getDailyRecommendationExercise();
        }
      case GetFoodRecommendationAction():
        {
          _getFoodRecommendation();
        }
      case GetExerciseCategoriesAction():
        {
          //  _getExerciseCategories();
          log("GetExerciseCategoriesAction");
        }
      case GetAllMuscelsAction():
        {
          _getAllMuscles();
        }
      case GetMusclesByGroupAction():
        {
          _getAllMusclesByGroup();
        }
    }
  }

  Future<void> _getDailyRecommendationExercise() async {
    emit(
      state.copyWith(getDailyRecommendationExerciseState: BaseLoadingState()),
    );
    final result = await _getDailyRecommendationExerciseUseCase(
      AppConstants.limit,
      AppConstants.targetMuscleGroupId,
      AppConstants.difficultyLevelId,
    );
    switch (result) {
      case ApiSuccessResult<List<ExerciseEntity>>():
        {
          dailyRecommendation = result.data;
          emit(
            state.copyWith(
              getDailyRecommendationExerciseState: BaseSuccessState(),
            ),
          );
        }
      case ApiErrorResult<List<ExerciseEntity>>():
        {
          emit(
            state.copyWith(
              getDailyRecommendationExerciseState: BaseErrorState(
                errorMessage: result.errorMessage.toString(),
              ),
            ),
          );
        }
    }
  }

  Future<void> _getFoodRecommendation() async {
    emit(state.copyWith(getFoodRecommendationState: BaseLoadingState()));
    final result = await _getFoodRecommendationUseCase();
    switch (result) {
      case ApiSuccessResult<List<MealEntity>>():
        {
          foodRecommendation = result.data;
          emit(state.copyWith(getFoodRecommendationState: BaseSuccessState()));
        }
      case ApiErrorResult<List<MealEntity>>():
        {
          emit(
            state.copyWith(
              getFoodRecommendationState: BaseErrorState(
                errorMessage: result.errorMessage.toString(),
              ),
            ),
          );
        }
    }
  }

  // Future<void> _getExerciseCategories() async {
  //   emit(state.copyWith(getExerciseCategoriesState: BaseLoadingState()));
  //   final result = await _getExerciseCategoriesUseCase();
  //   switch (result) {
  //     case ApiSuccessResult<List<CategoryEntity>>():
  //       {
  //         exerciseCategories = result.data;
  //         emit(state.copyWith(getExerciseCategoriesState: BaseSuccessState()));
  //       }
  //     case ApiErrorResult<List<CategoryEntity>>():
  //       {
  //         emit(
  //           state.copyWith(
  //             getExerciseCategoriesState: BaseErrorState(
  //               errorMessage: result.exception.toString(),
  //               exception: result.exception,
  //             ),
  //           ),
  //         );
  //       }
  //   }
  // }

  Future<void> _getAllMuscles() async {
    emit(state.copyWith(getAllMuscelsState: BaseLoadingState()));
    final result = await _getAllMusclesUseCase();
    switch (result) {
      case ApiSuccessResult<List<MuscleGroupEntity>?>():
        {
          muscleGroups = result.data!;
          emit(state.copyWith(getAllMuscelsState: BaseSuccessState()));
        }
      case ApiErrorResult<List<MuscleGroupEntity>?>():
        {
          emit(
            state.copyWith(
              getAllMuscelsState: BaseErrorState(
                errorMessage: result.errorMessage.toString(),
              ),
            ),
          );
        }
    }
  }

  Future<void> _getAllMusclesByGroup() async {
    emit(state.copyWith(getMusclesByGroupState: BaseLoadingState()));
    final result = await _getAllMusclesByGroupUseCase(
      AppConstants.muscleGroupId,
    );
    switch (result) {
      case ApiSuccessResult<List<MuscleEntity>?>():
        {
          muscles = result.data!;
          emit(state.copyWith(getMusclesByGroupState: BaseSuccessState()));
        }
      case ApiErrorResult<List<MuscleEntity>?>():
        {
          emit(
            state.copyWith(
              getMusclesByGroupState: BaseErrorState(
                errorMessage: result.errorMessage.toString(),
              ),
            ),
          );
        }
    }
  }
}
