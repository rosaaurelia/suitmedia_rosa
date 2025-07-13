import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_rosa/controllers/app_controller.dart';
import 'package:suitmedia_rosa/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  // const FirstScreen({super.key});

  final name = TextEditingController();
  final palindrome = TextEditingController();
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/ic_photo.png', width: 150, height: 150),
            SizedBox(height: 20),

            TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: palindrome,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Palindrome',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
            SizedBox(height: 60),

            SizedBox(
              width: double.infinity,
              height: context.mediaQuery.size.height * 0.055,
              child: ElevatedButton(
                onPressed: () {
                  final input = palindrome.text.trim(); // null safety check

                  if (input.isEmpty) {
                    Get.snackbar("Error", "Input tidak boleh kosong");
                    return;
                  }

                  final result = controller.isPalindrome(input);

                  Get.dialog(
                    AlertDialog(
                      title: Text("Result"),
                      content: Text(
                        result
                            ? "Teks tersebut merupakan rangkaian kata Palindrome"
                            : "Teks tersebut bukan rangkaian kata Palindrome",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('CHECK', style: TextStyle(fontSize: 16)),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: context.mediaQuery.size.height * 0.055,
              child: ElevatedButton(
                onPressed: () {
                  if (name.text.isEmpty) {
                    Get.snackbar("Error", "Name cannot be empty");
                    return;
                  }

                  controller.name.value = name.text;
                  Get.to(() => SecondScreen());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('NEXT', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
