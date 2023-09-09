import 'package:dart_openai/dart_openai.dart';

enum ChatMessageType { user, bot }

class ChatMessage {
  ChatMessage({
    required this.text,
    required this.chatMessageType,
  });

  final String text;
  final OpenAIChatMessageRole chatMessageType;
}
