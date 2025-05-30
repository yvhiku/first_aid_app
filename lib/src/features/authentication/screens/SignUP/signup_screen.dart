import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_strings.dart';
import 'package:flutter_application_1/src/features/authentication/screens/SignUP/signupform.dart';
import 'package:flutter_application_1/src/features/authentication/screens/login/login_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tSignUP), centerTitle: true, elevation: 0),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormHeaderWidget(
                image: tWelcomeScreenImage,
                title: tSignUpTitle,
                subtitle: tSignUpSubTitle,
              ),
              SignUpForm(),
              Column(
                children: [
                  const Text("OR"),
                  const SizedBox(height: tFormHeight - 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: Image(
                        image: AssetImage(tGoogleLogoImage),
                        width: 20.0,
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor: tSecondaryColor,
                        side: BorderSide(color: tSecondaryColor),
                        padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                      onPressed: () {},
                      label: Text(tSignInWithGoogle),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: Text.rich(
                      TextSpan(
                        text: tAlreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: tLogin,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
