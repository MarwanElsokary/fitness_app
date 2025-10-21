import 'package:bloc/bloc.dart';

part 'chat_with_ai_state.dart';

class ChatWithAiCubit extends Cubit<ChatWithAiState> {
  ChatWithAiCubit() : super(ChatWithAiInitial());
}
