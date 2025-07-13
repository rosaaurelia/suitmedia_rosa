import 'package:get/get.dart';
import '../models/app_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppController extends GetxController {
  var name = ''.obs; // menyimpan nama user dari first screen
  var selectedUserName =
      ''.obs; // menyimpan nama user yang dipilih dari third screen
  var users =
      <UserModel>[]
          .obs; // menyimpan daftar user yang diambil dari API ke UserModel
  var page = 1.obs; // untuk pagination API
  var isLoading = false.obs; // status loading saat mengambil data

  // method untuk mengecek apakah string adalah palindrome
  bool isPalindrome(String text) {
    final cleanedText =
        text
            .replaceAll(RegExp(r'[\W_]+', caseSensitive: false), '')
            .toLowerCase();
    return cleanedText == cleanedText.split('').reversed.join('');
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  // method untuk mengambil data user dari API
  // refresh: true untuk mengambil data baru, false untuk mengambil data berikutnya
  Future<void> fetchUsers({bool refresh = false}) async {
    if (isLoading.value) return;
    isLoading.value = true;
    if (refresh) {
      page.value = 1;
      users.clear();
    }

    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=${page.value}&per_page=10'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<UserModel> userList =
          (data['data'] as List).map((e) => UserModel.fromJson(e)).toList();
      if (refresh) {
        users.value = userList;
      } else {
        users.addAll(userList);
      }
      page.value++;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}
