class Endpoints {
  static const String baseUrl = 'https://fitness.elevateegy.com/api/v1';
  static const String mealsBaseUrl = "https://www.themealdb.com/api/json/v1/";
  static const String sampleEndpoint = '/sample-endpoint';
  static const String forgotPassword = "/auth/forgotPassword";
  static const String verifyResetCode = "/auth/verifyResetCode";
  static const String signUp = "/auth/signup";
  static const String resetPassword = "/auth/resetPassword";
  static const String login = "/auth/signin";
  static const String allLevels = "levels";
  static const String getAllDifficultyLevelsByPrimeMoverMuscle =
      "levels/difficulty-levels/by-prime-mover";

  //////////////////////////// Muscle Routes ////////////////////////////
  static const String allMuscles = "/muscles";
  static const String allMusclesGroup = "/musclesGroup";
  static const String musclesRandom = "muscles/random";
  static const String musclesGroupByMuscleGroup =
      "musclesGroup/by-muscle-group";

  //////////////////////////// Meals Routes ////////////////////////////
  static const String mealsCategories = "/1/categories.php";
  static const String filterMealsByCategory = "1/filter.php";
  static const String mealDetails = "1/lookup.php";

  /////////////////////////// Exercises Routes ////////////////////////////
  static const String allExercises = "exercises";
  static const String exercisesByMuscleDifficulty =
      "exercises/by-muscle-difficulty";
  static const String exercisesByRandom = "/exercises/random";
}
