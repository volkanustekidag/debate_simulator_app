import 'dart:io';

import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/model_view/chat_model_view.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/widgets/chat_list_widget.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/widgets/end_evaluate_button_widget.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/widgets/full_screen_loading.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/widgets/message_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});
  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState(title: title);
}

class _ChatPageState extends State<ChatPage> {
  _ChatPageState({required this.title});

  ChatModelView chatModelView = Get.put(ChatModelView());
  final _scrollController = ScrollController();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.secondaryDarkColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppStyles.secondaryDarkColor,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
        child: Stack(
          children: [
            Container(
              color: AppStyles.primaryDarkColor,
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  Column(
                    children: [
                      ChatListWidget(
                        scrollController: _scrollController,
                      ),
                      const SizedBox(height: 16),
                      MessageTextFieldWidget(
                        scrollController: _scrollController,
                      )
                    ],
                  ),
                  EndEvaluateButtonWidget(),
                ],
              ),
            ),
            FullScreenLoading()
          ],
        ),
      ),
    );
  }
}
