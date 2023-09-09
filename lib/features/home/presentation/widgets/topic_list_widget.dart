import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:debate_simulator_app/features/home/presentation/const/home_const.dart';
import 'package:debate_simulator_app/features/home/presentation/model_view/home_model_view.dart';
import 'package:debate_simulator_app/features/home/presentation/widgets/topic_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicList extends StatelessWidget {
  TopicList({
    super.key,
  });

  final HomeModelView _homeModelView = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Select Debate Topic",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Stack(
              children: [
                Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        HomeConst.discussionTopics.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: GestureDetector(
                              onTap: () {
                                _homeModelView.onSelectedTopic(
                                    HomeConst.discussionTopics[index]);
                              },
                              child: TopicCardWidget(
                                  discussionTopic:
                                      HomeConst.discussionTopics[index],
                                  selectedTopic:
                                      _homeModelView.selectedTopic.value,
                                  topicDescription:
                                      HomeConst.topicDescriptions[index])),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppStyles.primaryDarkColor,
                        AppStyles.primaryDarkColor.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 25,
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppStyles.primaryDarkColor,
                          AppStyles.primaryDarkColor.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
