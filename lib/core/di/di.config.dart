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
import '../../features/auth/presentation/reset_password/view_model/cubit/reset_password_cubit.dart'
    as _i1064;
import '../api_layer/api_client/api_client.dart' as _i225;
import '../api_layer/data_source_impl/auth/login/login_data_source_impl.dart'
    as _i100;
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
    gh.factory<_i344.LocaleCubit>(
      () => _i344.LocaleCubit(sharedPrefHelper: gh<_i744.SharedPrefHelper>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i528.PrettyDioLogger>(),
        gh<_i744.SharedPrefHelper>(),
      ),
    );
    gh.singleton<_i225.ApiClient>(() => _i225.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i665.LoginRemoteDataSource>(
      () => _i100.LoginRemoteDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i725.AuthRemoteDataSource>(
      () => _i257.AuthRemoteDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i632.LoginRepo>(
      () => _i216.LoginRepoImpl(gh<_i665.LoginRemoteDataSource>()),
    );
    gh.factory<_i630.LoginUseCase>(
      () => _i630.LoginUseCase(gh<_i632.LoginRepo>()),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i704.AuthRepoImpl(gh<_i725.AuthRemoteDataSource>()),
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
    gh.factory<_i793.OtpVerificationUseCase>(
      () => _i793.OtpVerificationUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i97.RegisterUseCase>(
      () => _i97.RegisterUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i825.ResetPasswordUseCase>(
      () => _i825.ResetPasswordUseCase(gh<_i723.AuthRepo>()),
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
    gh.factory<_i621.OtpVerificationCubit>(
      () => _i621.OtpVerificationCubit(
        gh<_i793.OtpVerificationUseCase>(),
        gh<_i591.ForgetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i948.DioModule {}

class _$SharedPreferencesModule extends _i744.SharedPreferencesModule {}
