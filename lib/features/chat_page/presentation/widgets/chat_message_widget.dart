import 'package:dart_openai/dart_openai.dart';
import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  final String text;
  final OpenAIChatMessageRole chatMessageType;

  @override
  Widget build(BuildContext context) {
    return chatMessageType != OpenAIChatMessageRole.system
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.all(16),
            color: chatMessageType == OpenAIChatMessageRole.assistant
                ? AppStyles.primaryDarkColor
                : AppStyles.secondaryDarkColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                chatMessageType == OpenAIChatMessageRole.assistant
                    ? Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF04A17A),
                          child: Image.asset(
                            "assets/images/chatgpt.png",
                            width: 40,
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
