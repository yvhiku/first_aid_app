import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_strings.dart';
import 'package:flutter_application_1/src/features/core/controlers/navbar.dart';
import 'package:flutter_application_1/src/features/authentication/screens/forget_password/forget_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tHint,
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: tFormHeight - 20),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                labelText: tPassword,
                hintText: tHintPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.to(() => const ForgetScreen()),
                child: Text(tForgot),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(),
                  foregroundColor: tWhiteColor,
                  backgroundColor: tPrimaryColor,
                  side: BorderSide(color: tSecondaryColor),
                  padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                ),
                onPressed: () => Get.to(() => const NavBar()),
                child: Text(tLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
