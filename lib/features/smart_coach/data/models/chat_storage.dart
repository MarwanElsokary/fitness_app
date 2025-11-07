// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'chat_history_model.dart';
//
// class ChatStorage {
//   static const _chatsKey = 'chats_history';
//
//   static Future<void> saveChats(List<ChatHistoryModel> chats) async {
//     final prefs = await SharedPreferences.getInstance();
//     final encoded = jsonEncode(
//       chats.map((c) => {
//         'id': c.id,
//         'title': c.title,
//         'messages': c.messages,
//       }).toList(),
//     );
//     await prefs.setString(_chatsKey, encoded);
//   }
//
//   static Future<List<ChatHistoryModel>> loadChats() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString(_chatsKey);
//     if (data == null) return [];
//     final decoded = jsonDecode(data) as List;
//     return decoded
//         .map((m) => ChatHistoryModel(
//       id: m['id'],
//       title: m['title'],
//       messages: List<Map<String, String>>.from(m['messages']),
//     ))
//         .toList();
//   }
// }
