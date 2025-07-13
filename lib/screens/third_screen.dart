import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_rosa/controllers/app_controller.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300, // warna garis
            height: 1,
          ),
        ),
      ),
      body: Center(child: Text('Second Screen Content')),
    );
  }
}
