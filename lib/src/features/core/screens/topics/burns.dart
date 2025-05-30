import 'package:flutter/material.dart';

class BurnScreen extends StatelessWidget {
  const BurnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Burn Treatment')),
      body: const Center(child: Text('Burn treatment content goes here')),
    );
  }
}