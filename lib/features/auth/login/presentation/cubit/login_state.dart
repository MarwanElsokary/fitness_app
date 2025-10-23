import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';

sealed class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState(this.loginResponseEntity);
}

class LoginErrorState extends LoginStates {
  final String message;

  LoginErrorState(this.message);
}
