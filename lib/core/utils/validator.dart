import 'package:injectable/injectable.dart';

@lazySingleton
class Validator {
  String? validateEmail(String input) {
    if (input.isEmpty) {
      return "Email cannot be empty";
    } else if (!RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(input)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String input) {
    if (input.isEmpty) {
      return "Password cannot be empty";
    } else if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    ).hasMatch(input)) {
      return "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.";
    }
    return null;
  }

  String? validateConfirmPassword(String input, String password) {
    if (input.isEmpty || input != password) {
      return "Passwords do not match";
    }
    return null;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return "Name cannot be empty";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return "invalid name";
    } else {
      return null;
    }
  }
}
