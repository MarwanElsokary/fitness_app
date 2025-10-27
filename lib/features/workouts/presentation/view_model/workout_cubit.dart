import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:fitness_app/features/workouts/domain/use_case/workout_use_case.dart';
import 'package:fitness_app/features/workouts/domain/use_case/muscles_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'workout_state.dart';

@injectable
class WorkoutCubit extends Cubit<WorkOutState> {
  WorkoutUseCase workoutUseCase;
  MusclesUseCase musclesUseCase;

  WorkoutCubit(this.musclesUseCase, this.workoutUseCase)
    : super(WorkOutInitial());

  void getWorkOuts() async {
    emit(WorkOutLoading());

    ApiResult<List<WorkoutEntity>> result = await workoutUseCase.call();

    switch (result) {
      case ApiSuccessResult<List<WorkoutEntity>>():
        emit(WorkOutLoaded(workouts: result.data));

        if (result.data.isNotEmpty) {
          getMuscles(result.data.first.Id);
        }
      case ApiErrorResult<List<WorkoutEntity>>():
        emit(WorkOutError(message: result.errorMessage));
    }
  }

  Future<void> getMuscles(String? muscleGroupId) async {
    emit(MusclesLoading());
    ApiResult<List<MusclesResponseEntity>> result = await musclesUseCase.call(
      muscleGroupId,
    );
    switch (result) {
      case ApiSuccessResult<List<MusclesResponseEntity>>():
        emit(MusclesLoaded(muscles: result.data));

      case ApiErrorResult<List<MusclesResponseEntity>>():
        emit(MusclesError(message: result.errorMessage));
    }
  }
}
