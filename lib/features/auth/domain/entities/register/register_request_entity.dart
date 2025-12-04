class RegisterRequestEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? gender;
  final int? height;
  final int? weight;
  final int? age;
  final String? goal;
  final String? activityLevel;

  RegisterRequestEntity({
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
}
