import 'package:doc_storage/Views/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doc store',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Login(),
    );
  }
}
