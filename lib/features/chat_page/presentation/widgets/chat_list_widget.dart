import 'package:debate_simulator_app/features/chat_page/presentation/model_view/chat_model_view.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/widgets/chat_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  ChatModelView chatModelView = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 36),
              controller: _scrollController,
              itemCount: chatModelView.chatMessages.value.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(
                    text: chatModelView.chatMessages[index].text,
                    chatMessageType:
                        chatModelView.chatMessages[index].chatMessageType);
              },
            ),
            chatModelView.isLoading.value
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32.0),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: const Color(0xFF04A17A),
                            child: Image.asset(
                              "assets/images/chatgpt.png",
                              width: 40,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Lottie.asset(
                            'assets/lottie/writing.json',
                            width: 36,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
