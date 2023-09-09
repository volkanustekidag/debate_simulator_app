import 'package:dart_openai/dart_openai.dart';
import 'package:debate_simulator_app/features/home/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    OpenAI.apiKey = "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";
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(const HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Center(
        child: Image.asset(
          "assets/images/app-icon.png",
          width: Get.width * 0.5,
        ),
      ),
    );
  }
}
