// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/impl/auth_remote_data_source_impl.dart'
    as _i257;
import '../../features/auth/data/datasources/intract/auth_remote_data_source.dart'
    as _i725;
import '../../features/auth/data/repos_impl/auth_repo_impl.dart' as _i704;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecases/forget_password_use_case.dart'
    as _i591;
import '../../features/auth/domain/usecases/otp_verification_use_case.dart'
    as _i793;
import '../../features/auth/domain/usecases/register_use_case.dart' as _i97;
import '../../features/auth/domain/usecases/reset_password_use_case.dart'
    as _i825;
import '../../features/auth/login/data/data_source/login_data_source.dart'
    as _i665;
import '../../features/auth/login/data/repo_impl/login_repo_impl.dart' as _i216;
import '../../features/auth/login/domain/repo/login_repo.dart' as _i632;
import '../../features/auth/login/domain/use_case/login_use_case.dart' as _i630;
import '../../features/auth/login/presentation/cubit/login_view_model.dart'
    as _i465;
import '../../features/auth/presentation/forget_password/view_model/cubit/forget_password_cubit.dart'
    as _i467;
import '../../features/auth/presentation/otp_verification/cubit/otp_verification_cubit.dart'
    as _i621;
import '../../features/auth/presentation/register/view_model/cubit/register_cubit.dart'
    as _i103;
import '../../features/auth/presentation/reset_password/view_model/cubit/reset_password_cubit.dart'
    as _i1064;
import '../../features/chang_password/data/datasources/contract/change_password_remote_data_source.dart'
    as _i625;
import '../../features/chang_password/data/datasources/impl/chang_password_data_source_impl.dart'
    as _i599;
import '../../features/chang_password/data/repos_impl/chang_password_repo_impl.dart'
    as _i137;
import '../../features/chang_password/domain/repositories/chang_password_repo.dart'
    as _i786;
import '../../features/chang_password/domain/usecases/chang_password_use_case.dart'
    as _i853;
import '../../features/chang_password/presentation/cubit/chang_password_cubit.dart'
    as _i112;
import '../../features/exercise/data/data_source/get_all_difficulty_levels_data_source.dart'
    as _i484;
import '../../features/exercise/data/data_source/get_exercises_data_source.dart'
    as _i137;
import '../../features/exercise/data/repo_impl/get_all_difficulty_levels_repo.dart'
    as _i129;
import '../../features/exercise/data/repo_impl/get_exercises_repo_impl.dart'
    as _i368;
import '../../features/exercise/domain/repo/get_all_difficulty_levels_repo.dart'
    as _i893;
import '../../features/exercise/domain/repo/get_exercises_repo.dart' as _i86;
import '../../features/exercise/domain/use_cases/get_all_difficulty_levels_use_case.dart'
    as _i240;
import '../../features/exercise/domain/use_cases/get_exercises_use_case.dart'
    as _i685;
import '../../features/exercise/presentation/view_model/cubit.dart' as _i862;
import '../../features/home/data/datasources/contract/home_remote_data_source.dart'
    as _i146;
import '../../features/home/data/datasources/impl/home_remote_data_source_impl.dart'
    as _i1004;
import '../../features/home/data/repos_impl/home_repo_impl.dart' as _i386;
import '../../features/home/domain/repositories/home_repo.dart' as _i1021;
import '../../features/home/domain/usecases/get_all_muscles_use_case.dart'
    as _i205;
import '../../features/home/domain/usecases/get_daily_recommendation_exercise_use_case.dart'
    as _i535;
import '../../features/home/domain/usecases/get_food_recommendation_use_case.dart'
    as _i283;
import '../../features/home/domain/usecases/get_muscles_by_group_use_case.dart'
    as _i399;
import '../../features/home/presentation/view_model/cubit/home_cubit.dart'
    as _i1039;
import '../../features/smart_coach/data/data_source/impl/chat_local_data_source_impl.dart'
    as _i82;
import '../../features/smart_coach/data/data_source/interfac/chat_local_datasource.dart'
    as _i366;
import '../../features/smart_coach/domain/repo/chat_repository.dart' as _i781;
import '../../features/smart_coach/presentation/view_model/chat_cubit.dart'
    as _i686;
import '../../features/workouts/data/data_source/muscles_data_source.dart'
    as _i160;
import '../../features/workouts/data/data_source/workout_data_source.dart'
    as _i107;
import '../../features/workouts/data/repo_impl/muscles_repo_impl.dart' as _i779;
import '../../features/workouts/data/repo_impl/workouts_repo_impl.dart'
    as _i383;
import '../../features/workouts/domain/repo/muscles_repo.dart' as _i423;
import '../../features/workouts/domain/repo/workouts_repo.dart' as _i301;
import '../../features/workouts/domain/use_case/muscles_use_case.dart' as _i187;
import '../../features/workouts/domain/use_case/workout_use_case.dart' as _i28;
import '../../features/workouts/presentation/view_model/workout_cubit.dart'
    as _i493;
import '../api_layer/api_client/api_client.dart' as _i225;
import '../api_layer/api_client/gemini_api_service.dart' as _i356;
import '../api_layer/api_client/meals_retrofit_client.dart' as _i450;
import '../api_layer/data_source_impl/auth/login/login_data_source_impl.dart'
    as _i100;
import '../api_layer/data_source_impl/exercises/get_all_difficulty_levels_data_source_impl.dart'
    as _i29;
import '../api_layer/data_source_impl/exercises/get_exercises_data_source_impl.dart'
    as _i425;
import '../api_layer/data_source_impl/workout/muscles_data_source_impl.dart'
    as _i330;
import '../api_layer/data_source_impl/workout/workouts_data_source_impl.dart'
    as _i1002;
import '../modules/dio_module.dart' as _i948;
import '../modules/shared_preferences_module.dart' as _i744;
import '../utils/language_cubit.dart' as _i344;
import '../utils/validator.dart' as _i449;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i449.Validator>(() => _i449.Validator());
    gh.singleton<_i744.SharedPrefHelper>(
      () => _i744.SharedPrefHelper(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i528.PrettyDioLogger>(),
        gh<_i744.SharedPrefHelper>(),
      ),
    );
    gh.singleton<_i366.ChatLocalDataSource>(
      () => _i82.ChatLocalDataSourceImpl(gh<_i744.SharedPrefHelper>()),
    );
    gh.lazySingleton<_i356.GeminiApiService>(
      () => _i356.GeminiApiService(gh<_i744.SharedPrefHelper>()),
    );
    gh.factory<_i344.LocaleCubit>(
      () => _i344.LocaleCubit(sharedPrefHelper: gh<_i744.SharedPrefHelper>()),
    );
    gh.singleton<_i781.ChatRepository>(
      () => _i781.ChatRepository(
        gh<_i356.GeminiApiService>(),
        gh<_i366.ChatLocalDataSource>(),
      ),
    );
    gh.singleton<_i225.ApiClient>(() => _i225.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i450.MealsRetrofitClient>(
      () => _i450.MealsRetrofitClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i686.ChatCubit>(
      () => _i686.ChatCubit(gh<_i781.ChatRepository>()),
    );
    gh.factory<_i160.MusclesDataSource>(
      () => _i330.MusclesDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i107.WorkoutDataSource>(
      () => _i1002.WorkoutsDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.singleton<_i146.HomeRemoteDataSource>(
      () => _i1004.HomeRemoteDataSourceImpl(
        gh<_i225.ApiClient>(),
        gh<_i450.MealsRetrofitClient>(),
      ),
    );
    gh.factory<_i665.LoginRemoteDataSource>(
      () => _i100.LoginRemoteDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i725.AuthRemoteDataSource>(
      () => _i257.AuthRemoteDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i625.ChangePasswordDataSource>(
      () => _i599.ChangePasswordDataSourceImp(gh<_i225.ApiClient>()),
    );
    gh.factory<_i137.GetExercisesDataSource>(
      () => _i425.GetExercisesDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i484.GetAllDifficultyLevelsDataSource>(
      () => _i29.GetAllDifficultyLevelsDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i632.LoginRepo>(
      () => _i216.LoginRepoImpl(gh<_i665.LoginRemoteDataSource>()),
    );
    gh.factory<_i786.ChangePasswordRepository>(
      () => _i137.ChangePasswordRepositoryImp(
        gh<_i625.ChangePasswordDataSource>(),
      ),
    );
    gh.factory<_i630.LoginUseCase>(
      () => _i630.LoginUseCase(gh<_i632.LoginRepo>()),
    );
    gh.factory<_i893.GetAllDifficultyLevelsRepo>(
      () => _i129.GetAllDifficultyLevelsRepoImpl(
        gh<_i484.GetAllDifficultyLevelsDataSource>(),
      ),
    );
    gh.factory<_i240.GetAllDifficultyLevelsUseCase>(
      () => _i240.GetAllDifficultyLevelsUseCase(
        gh<_i893.GetAllDifficultyLevelsRepo>(),
      ),
    );
    gh.factory<_i853.ChangePasswordUseCase>(
      () => _i853.ChangePasswordUseCase(gh<_i786.ChangePasswordRepository>()),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i704.AuthRepoImpl(gh<_i725.AuthRemoteDataSource>()),
    );
    gh.factory<_i1021.HomeRepo>(
      () => _i386.HomeRepoImpl(gh<_i146.HomeRemoteDataSource>()),
    );
    gh.factory<_i423.MusclesRepo>(
      () => _i779.MusclesRepoImpl(gh<_i160.MusclesDataSource>()),
    );
    gh.factory<_i301.WorkoutsRepo>(
      () => _i383.WorkoutsRepoImpl(gh<_i107.WorkoutDataSource>()),
    );
    gh.factory<_i112.ChangePasswordViewModel>(
      () => _i112.ChangePasswordViewModel(gh<_i853.ChangePasswordUseCase>()),
    );
    gh.factory<_i28.WorkoutUseCase>(
      () => _i28.WorkoutUseCase(gh<_i301.WorkoutsRepo>()),
    );
    gh.factory<_i86.GetExercisesRepo>(
      () => _i368.GetExercisesRepoImpl(gh<_i137.GetExercisesDataSource>()),
    );
    gh.factory<_i535.GetDailyRecommendationExerciseUseCase>(
      () => _i535.GetDailyRecommendationExerciseUseCase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i205.GetAllMusclesUseCase>(
      () => _i205.GetAllMusclesUseCase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i283.GetFoodRecommendationUseCase>(
      () => _i283.GetFoodRecommendationUseCase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i399.GetMusclesByGroupUseCase>(
      () => _i399.GetMusclesByGroupUseCase(gh<_i1021.HomeRepo>()),
    );
    gh.factory<_i465.LoginViewModel>(
      () => _i465.LoginViewModel(
        loginUseCase: gh<_i630.LoginUseCase>(),
        sharedPrefHelper: gh<_i744.SharedPrefHelper>(),
      ),
    );
    gh.factory<_i591.ForgetPasswordUseCase>(
      () => _i591.ForgetPasswordUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i97.RegisterUseCase>(
      () => _i97.RegisterUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i825.ResetPasswordUseCase>(
      () => _i825.ResetPasswordUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i793.OtpVerificationUseCase>(
      () => _i793.OtpVerificationUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i1039.HomeCubit>(
      () => _i1039.HomeCubit(
        gh<_i535.GetDailyRecommendationExerciseUseCase>(),
        gh<_i283.GetFoodRecommendationUseCase>(),
        gh<_i205.GetAllMusclesUseCase>(),
        gh<_i399.GetMusclesByGroupUseCase>(),
      ),
    );
    gh.factory<_i467.ForgetPasswordCubit>(
      () => _i467.ForgetPasswordCubit(
        gh<_i591.ForgetPasswordUseCase>(),
        gh<_i449.Validator>(),
      ),
    );
    gh.factory<_i1064.ResetPasswordCubit>(
      () => _i1064.ResetPasswordCubit(
        gh<_i825.ResetPasswordUseCase>(),
        gh<_i449.Validator>(),
      ),
    );
    gh.factory<_i187.MusclesUseCase>(
      () => _i187.MusclesUseCase(gh<_i423.MusclesRepo>()),
    );
    gh.factory<_i103.RegisterCubit>(
      () => _i103.RegisterCubit(
        gh<_i97.RegisterUseCase>(),
        gh<_i449.Validator>(),
      ),
    );
    gh.factory<_i685.GetExercisesUseCase>(
      () => _i685.GetExercisesUseCase(gh<_i86.GetExercisesRepo>()),
    );
    gh.factory<_i621.OtpVerificationCubit>(
      () => _i621.OtpVerificationCubit(
        gh<_i793.OtpVerificationUseCase>(),
        gh<_i591.ForgetPasswordUseCase>(),
      ),
    );
    gh.factory<_i862.ExerciseCubit>(
      () => _i862.ExerciseCubit(
        gh<_i685.GetExercisesUseCase>(),
        gh<_i240.GetAllDifficultyLevelsUseCase>(),
      ),
    );
    gh.factory<_i493.WorkoutCubit>(
      () => _i493.WorkoutCubit(
        gh<_i187.MusclesUseCase>(),
        gh<_i28.WorkoutUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i948.DioModule {}

class _$SharedPreferencesModule extends _i744.SharedPreferencesModule {}
