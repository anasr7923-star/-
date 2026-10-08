import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isArabic = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          _isArabic ? 'بوابة الفانوس السحري الرئيسي' : 'Magic Lantern Main Gateway',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🚀 تم تصحيح اسم الأيقونة برمجياً هنا لتصبح slideshow وتنهي الخطأ الأحمر تماماً
              const Icon(Icons.slideshow, size: 64, color: Colors.amber),
              const SizedBox(height: 16),
              Text(
                _isArabic ? 'مرحباً بك في المنظومة الشاملة' : 'Welcome to Universal Platform',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}