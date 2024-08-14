import 'package:flutter/material.dart';
import 'homepage.dart';
void main() {
  runApp(cab());
}

class cab extends StatelessWidget {
  const cab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

