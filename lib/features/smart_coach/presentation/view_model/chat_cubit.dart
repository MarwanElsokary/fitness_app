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

  Future<void> loadMessages() async {
    emit(ChatLoading());
    try {
      emit(ChatLoaded(List.from(messages)));
    } catch (e) {
      emit(ChatError('Failed to load chat history: $e'));
    }
  }

  Future<void> sendMessage(String userMessage) async {
    if (userMessage.trim().isEmpty) return;

    final userMsg = ChatMessage(text: userMessage, isUser: true);
    messages.add(userMsg);
    emit(ChatLoaded(List.from(messages)));

    try {
      await _repository.saveMessages(messages);

      final aiResponse = await _repository.sendMessage(userMessage);

      final aiMsg = ChatMessage(text: aiResponse, isUser: false);
      messages.add(aiMsg);

      await _repository.saveMessages(messages);

      emit(ChatLoaded(List.from(messages)));
    } catch (e) {
      emit(ChatError('Error sending message: $e'));
    }
  }

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
