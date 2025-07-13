import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_rosa/controllers/app_controller.dart';

class ThirdScreen extends StatelessWidget {
  final controller = Get.find<AppController>();
  final scroll = ScrollController();

  ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchUsers(refresh: true);
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        controller.fetchUsers();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
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
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.users.isEmpty) {
          return Center(child: Text('No users found'));
        } else {
          return ListView.separated(
            controller: scroll,
            itemCount: controller.users.length,
            separatorBuilder:
                (context, index) => Column(
                  children: [
                    SizedBox(height: 8),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email),
                onTap: () {
                  controller.selectedUserName.value =
                      "${user.firstName} ${user.lastName}";
                  Get.back();
                },
              );
            },
          );
        }
      }),
    );
  }
}
