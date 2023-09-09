import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:debate_simulator_app/features/home/presentation/model_view/home_model_view.dart';
import 'package:debate_simulator_app/features/home/presentation/widgets/side_tabbar_widget.dart';
import 'package:debate_simulator_app/features/home/presentation/widgets/start_debate_button_widget.dart';
import 'package:debate_simulator_app/features/home/presentation/widgets/topic_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeModelView homeModelView = Get.put(HomeModelView());

  String? selectedTopic;
  String? userSide;
  List<Map<String, String>> debateTranscript = [];
  double userScore = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryDarkColor,
      appBar: AppBar(
        title: const Text(
          "Debate Simulator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppStyles.secondaryDarkColor,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopicList(),
            SideTabbarWidget(),
            StartDebateButtonWidget(),
          ],
        ),
      ),
    );
  }
}
