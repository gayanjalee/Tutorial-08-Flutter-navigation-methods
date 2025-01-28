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
      title: 'Drawer Navigation with GetX',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          // Change the AppBar title based on the selected screen
          return Text(navigationController.currentScreenTitle.value);
        }),
      ),
      body: Obx(() {
        // Change the body content based on the current index
        return navigationController.currentIndex.value == 0
            ? const HomePage()
            : const SettingsPage();
      }),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 115, 9, 52)),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                navigationController.changeTab(0, 'Home');
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                navigationController.changeTab(1, 'Settings');
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
