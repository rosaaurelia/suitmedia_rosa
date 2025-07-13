import 'package:get/get.dart';
import '../models/app_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppController extends GetxController {
  var name = ''.obs;
  var selectedUserName = ''.obs;
  var users = <UserModel>[].obs;
  var page = 1.obs;
  var isLoading = false.obs;

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
