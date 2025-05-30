import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/authentication/screens/Welcome/welcom_screen.dart';
import 'package:flutter_application_1/src/utils/theme/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: WelcomScreen(),
    );
  }
}
