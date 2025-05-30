import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text(tFullname),
                prefixIcon: Icon(Icons.person_outlined, color: tSecondaryColor),
                labelStyle: TextStyle(color: tSecondaryColor),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email),
                labelStyle: TextStyle(color: tSecondaryColor),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: InputDecoration(
                label: Text(tPhoneNum),
                prefixIcon: Icon(Icons.phone),
                labelStyle: TextStyle(color: tSecondaryColor),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.key),
                labelStyle: TextStyle(color: tSecondaryColor),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: InputDecoration(
                label: Text(tConfirmPass),
                prefixIcon: Icon(Icons.key),
                labelStyle: TextStyle(color: tSecondaryColor),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
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
                onPressed: () {},
                child: Text(tSignUP.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
