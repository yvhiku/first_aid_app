import 'package:flutter/material.dart';

class PoisonScreen extends StatelessWidget {
  const PoisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Poison Emergency')),
      body: const Center(child: Text('Poison treatment content goes here')),
    );
  }
}