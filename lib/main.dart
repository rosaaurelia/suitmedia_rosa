import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:suitmedia_rosa/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Suitmedia Rosa',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
