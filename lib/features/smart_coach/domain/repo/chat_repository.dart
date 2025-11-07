import 'package:fitness_app/core/api_layer/api_client/gemini_api_service.dart';
import 'package:fitness_app/features/smart_coach/data/data_source/interfac/chat_local_datasource.dart';
import 'package:fitness_app/features/smart_coach/domain/entites/chat_message.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChatRepository {
  final GeminiApiService _geminiService;
  final ChatLocalDataSource _localDataSource;

  ChatRepository(this._geminiService, this._localDataSource);

  Future<String> sendMessage(String message) async {
    return await _geminiService.sendMessage(message);
  }

  Future<void> saveMessages(List<ChatMessage> messages) async {
    await _localDataSource.saveMessages(messages);
  }

  Future<List<ChatMessage>> getMessages() async {
    return await _localDataSource.getMessages();
  }

  Future<void> clearMessages() async {
    await _localDataSource.clearMessages();
  }
}
