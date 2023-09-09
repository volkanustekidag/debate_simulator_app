import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:debate_simulator_app/features/home/presentation/model_view/home_model_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicCardWidget extends StatelessWidget {
  TopicCardWidget({
    super.key,
    required this.discussionTopic,
    required this.selectedTopic,
    required this.topicDescription,
  });

  final String discussionTopic;
  final String topicDescription;
  final String selectedTopic;
  final HomeModelView _homeModelView = Get.put(HomeModelView());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          _homeModelView.onSelectedTopic(discussionTopic);
        },
        child: Card(
          color: selectedTopic == discussionTopic
              ? context.theme.colorScheme.primary
              : AppStyles.secondaryDarkColor,
          elevation: selectedTopic == discussionTopic ? null : 0,
          child: ListTile(
            title: Text(
              discussionTopic,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              topicDescription,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
