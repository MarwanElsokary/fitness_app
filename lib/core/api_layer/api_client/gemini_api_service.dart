import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:fitness_app/core/modules/shared_preferences_module.dart';
import 'package:fitness_app/core/keys/shared_key.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GeminiApiService {
  final SharedPrefHelper sharedPrefHelper;

  GeminiApiService(this.sharedPrefHelper);

  Future<String> sendMessage(String userMessage) async {
    try {
      final apiKey = sharedPrefHelper.getValue(SharedPrefKeys.apiKey);

      if (apiKey == null || apiKey.isEmpty) {
        throw Exception('Gemini API key not found in SharedPreferences');
      }

      final model = GenerativeModel(model: "gemini-2.0-flash", apiKey: apiKey);
      final content = [Content.text(userMessage)];
      final response = await model.generateContent(content);
      if (response.text != null && response.text!.isNotEmpty) {
        return response.text!;
      } else {
        return 'No response from AI';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
