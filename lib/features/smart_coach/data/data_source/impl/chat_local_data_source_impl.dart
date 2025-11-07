import 'dart:convert';
import 'package:fitness_app/features/smart_coach/data/data_source/interfac/chat_local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/modules/shared_preferences_module.dart';
import 'package:fitness_app/features/smart_coach/domain/entites/chat_message.dart';

@Singleton(as: ChatLocalDataSource)
class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  final SharedPrefHelper _prefs;
  static const String _chatKey = 'chat_history';

  ChatLocalDataSourceImpl(this._prefs);

  @override
  Future<void> saveMessages(List<ChatMessage> messages) async {
    final encoded = jsonEncode(messages.map((m) => m.toJson()).toList());
    await _prefs.setValue(_chatKey, encoded);
  }

  @override
  Future<List<ChatMessage>> getMessages() async {
    final data = _prefs.getValue(_chatKey);
    if (data == null || data.toString().isEmpty) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => ChatMessage.fromJson(e)).toList();
  }

  @override
  Future<void> clearMessages() async {
    await _prefs.remove(_chatKey);
  }
}
