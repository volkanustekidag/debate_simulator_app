import 'package:dart_openai/dart_openai.dart';
import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/model/chat_message_model.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/model_view/chat_model_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageTextFieldWidget extends StatelessWidget {
  MessageTextFieldWidget({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;
  TextEditingController textEditingController = TextEditingController();
  ChatModelView chatModelView = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: const BoxDecoration(
        color: AppStyles.secondaryDarkColor,
      ),
      child: TextField(
        controller: textEditingController,
        style: const TextStyle(color: Colors.white),
        minLines: 1,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            hintText: "Write something...",
            hintStyle: const TextStyle(color: Colors.white38),
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: () {
                chatModelView
                    .getAssistantReply(
                      ChatMessage(
                        text: textEditingController.text,
                        chatMessageType: OpenAIChatMessageRole.user,
                      ),
                    )
                    .then((value) => _scrollDown());
                textEditingController.clear();
              },
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            )),
      ),
    );
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
