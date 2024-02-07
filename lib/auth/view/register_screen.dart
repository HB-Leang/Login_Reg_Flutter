import 'package:final_project/auth/widget/input_text.dart';
import 'package:final_project/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final conPassword = TextEditingController();
  RxBool checkPass = true.obs;
  RxBool checkConPass = true.obs;
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
                      "Register",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputText(
                      controller: username,
                      hintText: "Username",
                      prefixIcon: "assets/icons/user_icon.png",
                      obscureText: false,
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
                          onPressed: () => checkPass.value = !checkPass.value,
                          icon: (checkPass.value == true)
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.remove_red_eye),
                        ),
                        obscureText: checkPass.value,
                      ),
                    ),
                    Obx(
                      () => InputText(
                        controller: conPassword,
                        hintText: "Confirm password",
                        prefixIcon: "assets/icons/lock.png",
                        suffixIcon: IconButton(
                          onPressed: () =>
                              checkConPass.value = !checkConPass.value,
                          icon: (checkConPass.value == true)
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.remove_red_eye),
                        ),
                        obscureText: checkConPass.value,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: shapeColor,
                        onPressed: () {},
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(text: "Already have an account?  "),
                          TextSpan(
                              text: "Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline)),
                          TextSpan(text: "  instead"),
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
