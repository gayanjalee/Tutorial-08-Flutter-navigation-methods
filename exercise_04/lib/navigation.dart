import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var currentScreenTitle = 'Home'.obs;

  void changeTab(int index, String title) {
    currentIndex.value = index;
    currentScreenTitle.value = title;
  }
}
