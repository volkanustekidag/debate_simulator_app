import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/model_view/chat_model_view.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/view/chat_page.dart';
import 'package:debate_simulator_app/features/home/presentation/model_view/home_model_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartDebateButtonWidget extends StatelessWidget {
  StartDebateButtonWidget({
    super.key,
  });

  final HomeModelView _homeModelView = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppStyles.secondaryDarkColor),
        onPressed: () async {
          Get.put(ChatModelView()).initDebate(
              _homeModelView.selectedTopic.value,
              _homeModelView.selectedSide.value);
          Get.to(ChatPage(
            title: _homeModelView.selectedTopic.value,
          ))!
              .then((value) => Get.delete<ChatModelView>());
        },
        child: const Text(
          "Start Debate",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
