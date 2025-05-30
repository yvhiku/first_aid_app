import 'package:flutter/material.dart';

class WoundScreen extends StatelessWidget {
  const WoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wound Care')),
      body: const Center(child: Text('Wound care content goes here')),
    );
  }
}