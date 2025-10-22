import 'package:fitness_app/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "weight")
  final int? weight;
  @JsonKey(name: "age")
  final int? age;
  @JsonKey(name: "goal")
  final String? goal;
  @JsonKey(name: "activityLevel")
  final String? activityLevel;

  RegisterRequestDto({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.goal,
    this.activityLevel,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestDtoToJson(this);
  }

  factory RegisterRequestDto.fromDomain(RegisterRequestEntity entity) {
    return RegisterRequestDto(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
      rePassword: entity.rePassword,
      gender: entity.gender,
      height: entity.height,
      weight: entity.weight,
      age: entity.age,
      goal: entity.goal,
      activityLevel: entity.activityLevel,
    );
  }
}
