import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_styles.dart';

class ChatDrawer extends StatelessWidget {
  final Function(String) onSelectChat;

  const ChatDrawer({super.key, required this.onSelectChat});

  @override
  Widget build(BuildContext context) {
    // قائمة ثابتة كأمثلة
    final List<String> chats = [
      "Hello! How can I help you?",
      "Tell me a joke",
      "What's the weather today?",
    ];

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.orange),
            child: Text('Previous Chats', style: AppStyles.medium16white),
          ),
          ...chats.map((chat) => ListTile(
            title: Text(
              chat,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              onSelectChat(chat);
              Navigator.of(context).pop();
            },
          )),
        ],
      ),
    );
  }
}
