import 'package:fitness_app/features/smart_coach/domain/entites/chat_message.dart';
import 'package:fitness_app/features/smart_coach/domain/repo/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _repository;

  ChatCubit(this._repository) : super(ChatInitial());

  List<ChatMessage> messages = [];

  /// تحميل كل الرسائل القديمة
  Future<void> loadMessages() async {
    emit(ChatLoading());
    try {
      messages = await _repository.getMessages();
      emit(ChatLoaded(List.from(messages)));
    } catch (e) {
      emit(ChatError('Failed to load chat history: $e'));
    }
  }

  /// إرسال رسالة جديدة إلى Gemini
  Future<void> sendMessage(String userMessage) async {
    if (userMessage.trim().isEmpty) return;

    // أضف رسالة المستخدم
    final userMsg = ChatMessage(text: userMessage, isUser: true);
    messages.add(userMsg);
    emit(ChatLoaded(List.from(messages)));

    try {
      // خزّن الرسائل الحالية محليًا
      await _repository.saveMessages(messages);

      // أرسل إلى API
      final aiResponse = await _repository.sendMessage(userMessage);

      // أضف رد الذكاء الاصطناعي
      final aiMsg = ChatMessage(text: aiResponse, isUser: false);
      messages.add(aiMsg);

      // خزّن كل المحادثة بعد الرد
      await _repository.saveMessages(messages);

      emit(ChatLoaded(List.from(messages)));
    } catch (e) {
      emit(ChatError('Error sending message: $e'));
    }
  }

  /// مسح المحادثة بالكامل
  Future<void> clearChat() async {
    messages.clear();
    try {
      await _repository.clearMessages();
      emit(ChatLoaded([]));
    } catch (e) {
      emit(ChatError('Failed to clear chat: $e'));
    }
  }
}
