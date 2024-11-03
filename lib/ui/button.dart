import 'package:flutter/material.dart';
import 'package:workshop_sample_app/pages/homepage.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 30),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
      child: const Text('スタート'),
    );
  }
}
