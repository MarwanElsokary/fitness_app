import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/resources/app_constants.dart';
import 'package:fitness_app/core/resources/locale_keys.g.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:fitness_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../view/screens/activity_selection_screen.dart';
import '../../view/screens/age_selection_screen.dart';
import '../../view/screens/gender_selection_screen.dart';
import '../../view/screens/goal_selection_screen.dart';
import '../../view/screens/height_selection_screen.dart';
import '../../view/screens/weight_selection_screen.dart';
import '../../view/widgets/register_form.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  final Validator validator;

  RegisterCubit(this._registerUseCase, this.validator)
    : super(RegisterState(registerState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final PageController pageController = PageController();

  final ValueNotifier<String?> genderNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<int?> ageNotifier = ValueNotifier<int?>(null);
  final ValueNotifier<int?> weightNotifier = ValueNotifier<int?>(null);
  final ValueNotifier<int?> heightNotifier = ValueNotifier<int?>(null);
  final ValueNotifier<String?> goalNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<String?> activityNotifier = ValueNotifier<String?>(null);

  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

  final ValueNotifier<bool> isValidate = ValueNotifier<bool>(false);

  List<Widget> pages = [
    const RegisterForm(),
    const GenderSelectionScreen(),
    const AgeSelectionScreen(),
    const WeightSelectionScreen(),
    const HeightSelectionScreen(),
    const GoalSelectionScreen(),
    const ActivitySelectionScreen(),
  ];

  final Map<String, String> goalsMap = {
    LocaleKeys.GainWeight: AppConstants.gainWeight,
    LocaleKeys.LoseWeight: AppConstants.loseWeight,
    LocaleKeys.GetFitter: AppConstants.getFitter,
    LocaleKeys.GainMoreFlexible: AppConstants.gainMoreFlexible,
    LocaleKeys.LearnTheBasic: AppConstants.learnTheBasic,
  };

  List<String> get goals => goalsMap.keys.toList();

  final Map<String, String> activityLevelMap = {
    LocaleKeys.Rookie: AppConstants.rookieLevel,
    LocaleKeys.Beginner: AppConstants.beginnerLevel,
    LocaleKeys.Intermediate: AppConstants.intermediateLevel,
    LocaleKeys.Advanced: AppConstants.advancedLevel,
    LocaleKeys.TrueBeast: AppConstants.trueBeastLevel,
  };

  List<String> get activityLevels => activityLevelMap.keys.toList();

  void doIntent(RegisterAction action) {
    switch (action) {
      case UserRegistrationAction():
        _register();
      case NextStepAction():
        _nextStep();
      case PreviousStepAction():
        _previousStep();
      case ChangeStepAction():
        _changeStep(action.stepIndex);
      case FormDataChangedAction():
        _validateFormData();
    }
  }

  void _nextStep() {
    if (state.stepIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _changeStep(state.stepIndex + 1);
    }
  }

  void _previousStep() {
    if (state.stepIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _changeStep(state.stepIndex - 1);
    }
  }

  void _changeStep(int stepIndex) {
    emit(
      state.copyWith(registerState: BaseInitialState(), stepIndex: stepIndex),
    );
  }

  void _register() async {
    emit(state.copyWith(registerState: BaseLoadingState()));
    final request = RegisterRequestEntity(
      email: emailController.text,
      password: passwordController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      rePassword: passwordController.text,
      gender: genderNotifier.value,
      age: ageNotifier.value,
      weight: weightNotifier.value,
      height: heightNotifier.value,
      goal: goalsMap[goalNotifier.value],
      activityLevel: activityLevelMap[activityNotifier.value],
    );
    final result = await _registerUseCase.call((request));

    switch (result) {
      case ApiSuccessResult<RegisterResponseEntity>():
        {
          emit(
            state.copyWith(
              registerState: BaseSuccessState<RegisterResponseEntity>(),
            ),
          );
        }
      case ApiErrorResult<RegisterResponseEntity>():
        {
          emit(
            state.copyWith(
              registerState: BaseErrorState(errorMessage: result.errorMessage),
            ),
          );
        }
    }
  }

  void _validateFormData() {
    if (state.stepIndex == 0 &&
        (firstNameController.text.isEmpty ||
            lastNameController.text.isEmpty ||
            emailController.text.isEmpty ||
            passwordController.text.isEmpty)) {
      isValidate.value = false;
    } else if (state.stepIndex == 1 && genderNotifier.value == null) {
      isValidate.value = false;
    } else if (state.stepIndex == 2 && ageNotifier.value == null) {
      isValidate.value = false;
    } else if (state.stepIndex == 3 && weightNotifier.value == null) {
      isValidate.value = false;
    } else if (state.stepIndex == 4 && heightNotifier.value == null) {
      isValidate.value = false;
    } else if (state.stepIndex == 5 && goalNotifier.value == null) {
      isValidate.value = false;
    } else if (state.stepIndex == 6 && activityNotifier.value == null) {
      isValidate.value = false;
    } else if (!formKey.currentState!.validate()) {
      isValidate.value = false;
    } else {
      isValidate.value = true;
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    genderNotifier.dispose();
    ageNotifier.dispose();
    weightNotifier.dispose();
    heightNotifier.dispose();
    goalNotifier.dispose();
    activityNotifier.dispose();
    isPasswordVisible.dispose();
    isValidate.dispose();
    pageController.dispose();
    return super.close();
  }
}
