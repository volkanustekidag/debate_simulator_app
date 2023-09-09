import 'package:debate_simulator_app/features/home/presentation/const/home_const.dart';
import 'package:debate_simulator_app/features/home/presentation/model_view/home_model_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:debate_simulator_app/core/styles/app_styles.dart';

class SideTabbarWidget extends StatelessWidget {
  SideTabbarWidget({
    super.key,
  });

  final HomeModelView _homeModelView = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Select Simulator Side",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: List.generate(
                HomeConst.sides.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HomeConst.sides[index] ==
                              _homeModelView.selectedSide.value
                          ? context.theme.primaryColor
                          : AppStyles.primaryDarkColor,
                    ),
                    onPressed: () {
                      _homeModelView.onChangeSide(HomeConst.sides[index]);
                    },
                    child: Text(
                      HomeConst.sides[index],
                      style: TextStyle(
                        color: HomeConst.sides[index] ==
                                _homeModelView.selectedSide.value
                            ? Colors.white
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
