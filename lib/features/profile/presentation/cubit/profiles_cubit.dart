import 'dart:developer';

import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/profile/domain/entities/profile_entity.dart';
import 'package:fitness_app/features/profile/domain/usecases/profile_use_case.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profiles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel(this._profileUseCase) : super(LoadingProfileState());

  final ProfileUseCase _profileUseCase;

  void doIntent(ProfileIntent profileIntent) {
    switch (profileIntent) {
      case ProfileClickedIntent():
        _getProfile();
        break;
    }
  }

  Future<void> _getProfile() async {
    emit(LoadingProfileState());

    final result = await _profileUseCase.call();

    switch (result) {
      case ApiSuccessResult<ProfileEntity>():
        final profile = result.data;
        if (isClosed) {
          log("The Cubit is closed");
          return;
        }
        // ignore: unnecessary_null_comparison
        if (profile != null) {
          emit(SuccessProfileState(profile.user));
          // ignore: dead_code
        } else {
          emit(ErrorProfileState(profile.message ?? 'No user data'));
        }
        break;

      case ApiErrorResult<ProfileEntity>():
        emit(ErrorProfileState(result.errorMessage.toString()));
        break;
    }
  }
}

sealed class ProfileIntent {}

class ProfileClickedIntent extends ProfileIntent {}
