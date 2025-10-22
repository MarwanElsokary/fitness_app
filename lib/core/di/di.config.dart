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
    as _i1032;
import '../../features/auth/data/datasources/intract/auth_remote_data_source.dart'
    as _i610;
import '../../features/auth/data/repos_impl/auth_repo_impl.dart' as _i1030;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i342;
import '../../features/auth/domain/usecases/forget_password_use_case.dart'
    as _i876;
import '../../features/auth/domain/usecases/otp_verification_use_case.dart'
    as _i730;
import '../../features/auth/domain/usecases/reset_password_use_case.dart'
    as _i255;
import '../api_layer/api_client/api_client.dart' as _i225;
import '../modules/dio_module.dart' as _i948;
import '../modules/shared_preferences_module.dart' as _i744;
import '../utils/language_cubit.dart' as _i344;

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
    gh.factory<_i610.AuthRemoteDataSource>(
      () => _i1032.AuthRemoteDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i342.AuthRepo>(
      () => _i1030.AuthRepoImpl(gh<_i610.AuthRemoteDataSource>()),
    );
    gh.factory<_i876.ForgetPasswordUseCase>(
      () => _i876.ForgetPasswordUseCase(gh<_i342.AuthRepo>()),
    );
    gh.factory<_i730.OtpVerificationUseCase>(
      () => _i730.OtpVerificationUseCase(gh<_i342.AuthRepo>()),
    );
    gh.factory<_i255.ResetPasswordUseCase>(
      () => _i255.ResetPasswordUseCase(gh<_i342.AuthRepo>()),
    );
    return this;
  }
}

class _$DioModule extends _i948.DioModule {}

class _$SharedPreferencesModule extends _i744.SharedPreferencesModule {}
