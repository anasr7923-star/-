import 'package:flutter/material.dart';
import 'login_screen.dart'; // ربط شاشة تسجيل الدخول الرئيسية لفتح باقي التطبيق

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
        // إعدادات الألوان والهوية الملكية للتطبيق
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true, // متوافق تماماً مع تحديثات فلاتر السحابية الجديدة
      ),
      // نقطة الانطلاق الرسمية؛ ومنها ينفتح رادار الـ GPS، المحفظة، ولوحة التحكم
      home: const LoginScreen(), 
    );
  }
}