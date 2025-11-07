import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/theme/app_assets.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_styles.dart';
import 'package:fitness_app/features/smart_coach/presentation/view_model/chat_cubit.dart';
import 'package:fitness_app/features/smart_coach/presentation/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entites/chat_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatCubit>()..loadMessages(),
      child: const ChatScreenBody(),
    );
  }
}

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(ChatCubit cubit) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    cubit.sendMessage(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        List<ChatMessage> messages = [];
        if (state is ChatLoaded) messages = state.messages;

        return SharedScaffold(
          title: 'Smart Coach Chat',
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isUser = msg.isUser;

                    return Row(
                      mainAxisAlignment: isUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isUser)
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: CircleAvatar(
                              radius: 16.r,
                              backgroundImage: AssetImage(AppAssets.ai),
                            ),
                          ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 6.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: isUser
                                  // ignore: deprecated_member_use
                                  ? AppColors.orange.withOpacity(0.9)
                                  // ignore: deprecated_member_use
                                  : Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              msg.text,
                              style: AppStyles.medium16white,
                            ),
                          ),
                        ),
                        if (isUser)
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: CircleAvatar(
                              radius: 16.r,
                              backgroundImage: AssetImage(AppAssets.ai),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: AppStyles.medium16white,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: AppStyles.medium16white.copyWith(
                            color: Colors.white54,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: AppColors.orange),
                      onPressed: () => _sendMessage(cubit),
                    ),
                  ],
                ),
              ),
            ],
          ),
          endDrawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: AppColors.orange),
                  child: Text('Previous Chats', style: AppStyles.medium16white),
                ),
                ...messages.map((msg) {
                  return ListTile(
                    title: Text(
                      msg.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      cubit.loadMessages();
                      Navigator.of(context).pop();
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
