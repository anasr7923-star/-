import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Lantern',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        // تم حذف السطر التالي
        // useMaterialDesign: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.flash_on, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              const Text(
                'تطبيق الفانوس السحري جاهز',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Text(
                'تم التجميع بنجاح كاسح عبر السيرفر السحابي',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
