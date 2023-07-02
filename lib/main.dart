import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/user_form/view/user_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserFormScreen(),
    );
  }
}
