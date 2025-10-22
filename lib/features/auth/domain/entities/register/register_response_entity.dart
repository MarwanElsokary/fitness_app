import 'package:fitness_app/features/auth/domain/entities/user_entity.dart';

class RegisterResponseEntity {
  final String? message;
  final UserEntity? user;
  final String? token;

  RegisterResponseEntity({this.message, this.user, this.token});
}
