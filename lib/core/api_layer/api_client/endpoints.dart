class Endpoints {
  static const String baseUrl = 'https://fitness.elevateegy.com/api/v1';
  static const String mealsBaseUrl = "https://www.themealdb.com/api/json/v1/";
  static const String sampleEndpoint = '/sample-endpoint';
  static const String forgotPassword = "/auth/forgotPassword";
  static const String changePassword = "/auth/change-password";
  static const String verifyResetCode = "/auth/verifyResetCode";
  static const String signUp = "/auth/signup";
  static const String resetPassword = "/auth/resetPassword";
  static const String login = "/auth/signin";
  static const String workout = "/muscles";
  static const String muscleGroupById = "/musclesGroup/by-muscle-group";

  static const String allLevels = "levels";
  static const String getAllDifficultyLevelsByPrimeMoverMuscle =
      "/levels/difficulty-levels/by-prime-mover";

  static const String allMuscles = "/muscles";
  static const String allMusclesGroup = "/musclesGroup";
  static const String mealsCategories = "/1/categories.php";
  static const String exercisesByRandom = "/exercises/random";
  static const String exercisesByMuscleDifficulty =
      "/exercises/by-muscle-difficulty";
  static const String getProfileData = "/auth/profile-data";
  static const String logout = "/auth/logout";
}
