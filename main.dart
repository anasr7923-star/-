import 'package:flutter/material.dart';
import 'login_screen.dart'; // ربط شاشة تسجيل الدخول لفتح باقي المنظومة

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الفانوس السحري',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: const LoginScreen(), 
    );
  }
}
