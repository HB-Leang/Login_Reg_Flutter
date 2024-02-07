import 'package:final_project/auth/controller/user_controller.dart';
import 'package:final_project/auth/view/register_screen.dart';
import 'package:final_project/auth/widget/input_text.dart';
import 'package:final_project/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final userController = Get.put(UserController());
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool check = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputText(
                      controller: email,
                      hintText: "Email",
                      prefixIcon: "assets/icons/mail.png",
                      obscureText: false,
                    ),
                    Obx(
                      () => InputText(
                        controller: password,
                        hintText: "Password",
                        prefixIcon: "assets/icons/lock.png",
                        suffixIcon: IconButton(
                          onPressed: () => check.value = !check.value,
                          icon: (check.value == true)
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.remove_red_eye),
                        ),
                        obscureText: check.value,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: shapeColor,
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Or login with",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 26,
                            child: Image.asset("assets/icons/google logo.webp"),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await userController.signInAnon();
                          },
                          child: CircleAvatar(
                            radius: 22,
                            child: Image.asset("assets/icons/guest_avatar.png"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          const TextSpan(text: "Don't have an acount?  "),
                          TextSpan(
                              text: "Sign up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(RegisterScreen()),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline)),
                          const TextSpan(text: "  now"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Traingle
          Positioned(
            left: -150,
            bottom: -100,
            child: ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                  ),
                  color: shapeColor,
                ),
              ),
            ),
          ),
          // Circle
          Positioned(
            right: -150,
            bottom: -150,
            child: Container(
              width: 300,
              height: 300,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: shapeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
