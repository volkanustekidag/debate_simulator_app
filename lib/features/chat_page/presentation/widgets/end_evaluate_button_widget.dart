import 'package:debate_simulator_app/features/chat_page/presentation/model_view/chat_model_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndEvaluateButtonWidget extends StatelessWidget {
  EndEvaluateButtonWidget({
    super.key,
  });

  ChatModelView chatModelView = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => chatModelView.chatMessages.value.length > 3
          ? Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () {
                  chatModelView.evaluateDiscussion(context);
                },
                child: const Text("End the discussionc and evaluate"),
              ),
            )
          : Container(),
    );
  }
}
