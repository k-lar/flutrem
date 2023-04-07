import 'package:flutter/material.dart';

class EasterEgg extends StatefulWidget {
  const EasterEgg({super.key});

  @override
  State<EasterEgg> createState() => _EasterEggState();
}

class _EasterEggState extends State<EasterEgg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UwU u found my seqwuet'),
      ),
      body: const Center(child: Text('Lov u :O')),
    );
  }
}
