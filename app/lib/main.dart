import 'package:app/features/home/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SeeFood());
}

class SeeFood extends StatelessWidget {
  const SeeFood({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
