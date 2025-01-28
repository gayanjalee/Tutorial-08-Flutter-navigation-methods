import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nav/Page2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Hello World!'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Get.to(const Page2());
                },
                child: const Text("Click to goto page 2"))
          ]),
        ),
      ),
    );
  }
}
