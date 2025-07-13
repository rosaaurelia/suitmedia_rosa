import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_rosa/controllers/app_controller.dart';
import 'package:suitmedia_rosa/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Second Screen Content'),
            Text('Welcome, ${controller.name.value}'), // ✅ aman
            Text('Selected User: ${controller.selectedUserName.value}'),
          ],
        ),
      ),
    );
  }
}
