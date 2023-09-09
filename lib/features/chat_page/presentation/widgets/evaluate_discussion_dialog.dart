import 'package:debate_simulator_app/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvaluateDiscussionDialog extends StatelessWidget {
  const EvaluateDiscussionDialog({
    super.key,
    required this.evaluateText,
  });
  final String evaluateText;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      insetAnimationDuration: const Duration(milliseconds: 100),
      backgroundColor: Colors.transparent,
      child: Container(
        height: Get.height * 0.8,
        width: 1000,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppStyles.secondaryDarkColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const Text(
              "Here is the review of the debate",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      evaluateText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.6,
                          fontWeight: FontWeight.normal),
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
                          AppStyles.secondaryDarkColor,
                          AppStyles.secondaryDarkColor.withOpacity(0.0),
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
                            AppStyles.secondaryDarkColor,
                            AppStyles.secondaryDarkColor.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: const Text("Okay"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
