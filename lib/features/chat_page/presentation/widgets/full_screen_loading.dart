import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/model_view/chat_model_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoading extends StatelessWidget {
  FullScreenLoading({
    super.key,
  });

  ChatModelView chatModelView = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => chatModelView.isSendEvaluate.value
          ? Container(
              color: AppStyles.secondaryDarkColor.withOpacity(0.7),
              height: Get.height,
              width: Get.width,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(),
    );
  }
}
