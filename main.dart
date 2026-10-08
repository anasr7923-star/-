import 'package:flutter/material.dart';
import 'login_screen.dart'; // ربط شاشة تسجيل الدخول الملكية مالتك لفتح باقي التطبيق

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
      // ثيم افتراضي حديث ونظيف 100% ومتوافق مع الإصدار الجديد بدون أي أسطر معوجة
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      // نقطة الانطلاق الرسمية لفتح شاشات الكباتن والركاب والمحافظ
      home: const LoginScreen(), 
    );
  }
}