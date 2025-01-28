import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import 'navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bottom Navigation (Home & Settings)',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Switch screens based on the current index
        return navigationController.currentIndex.value == 0
            ? const HomePage()
            : const SettingsPage();
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: (index) => navigationController.changeTab(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        );
      }),
    );
  }
}
