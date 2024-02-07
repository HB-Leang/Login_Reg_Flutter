import 'package:final_project/auth/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            userController.logoutUser();
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
