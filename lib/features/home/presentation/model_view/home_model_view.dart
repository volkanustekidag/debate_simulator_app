import 'package:get/get.dart';

class HomeModelView extends GetxController {
  Rx<String> selectedSide = "For".obs;
  Rx<String> selectedTopic = "Tech & Relationships".obs;

  onChangeSide(String value) => selectedSide.value = value;

  onSelectedTopic(String value) => selectedTopic.value = value;
}
