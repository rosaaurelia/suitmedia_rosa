import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_rosa/controllers/app_controller.dart';
import 'package:suitmedia_rosa/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue),
          onPressed: () => Get.back(),
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Welcome', style: TextStyle(fontSize: 16)),
            Obx(
              () => Text(
                controller.name.value,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),

            Spacer(),

            Obx(
              () => Center(
                child: Text(
                  controller.selectedUserName.value.isEmpty
                      ? "Selected User Name"
                      : controller.selectedUserName.value,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              height: context.mediaQuery.size.height * 0.055,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => SecondScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B637B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Choose a User',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
