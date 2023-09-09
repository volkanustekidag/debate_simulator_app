import 'package:debate_simulator_app/features/chat_page/data/services/open_ai_services.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/model/chat_message_model.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/widgets/evaluate_discussion_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:dart_openai/dart_openai.dart';

class ChatModelView extends GetxController {
  final OpenAIServices _openAIServices = OpenAIServices();

  RxList<ChatMessage> chatMessages = <ChatMessage>[].obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isSendEvaluate = false.obs;

// Generate Debate Prompt
  Future generateDebatePrompt(String topic, String side) async {
    final response = await _openAIServices.generateDebatePrompt(topic, side);

    chatMessages.add(
      ChatMessage(
        text: response,
        chatMessageType: OpenAIChatMessageRole.system,
      ),
    );

    chatMessages.refresh();
  }

  Future getAssistantReply(ChatMessage chatMessage) async {
    if (chatMessage.text.isNotEmpty) {
      isLoading.value = true;
      chatMessages.value.add(chatMessage);
      chatMessages.refresh();

      await _openAIServices.getAssistantReply(chatMessages).then((value) {
        chatMessages.add(ChatMessage(
            text: value, chatMessageType: OpenAIChatMessageRole.assistant));
        chatMessages.refresh();
        isLoading.value = false;
      });
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Please do not enter a blank message.",
        duration: Duration(seconds: 1),
      ));
    }
  }

  Future evaluateDiscussion(context) async {
    isSendEvaluate.value = true;
    await _openAIServices.evaluateDiscussion(chatMessages.value).then((value) {
      isSendEvaluate.value = false;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => EvaluateDiscussionDialog(evaluateText: value),
      );
    });
  }

  initDebate(String topic, String side) {
    OpenAI.apiKey = "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";
    generateDebatePrompt(topic, side);
  }
}
