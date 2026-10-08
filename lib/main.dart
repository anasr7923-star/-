import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'network_service.dart'; // 📡 ربط عصب الشبكة والمحافظ السحابية الحية

void main() {
  runApp(const MagicLanternApp());
}

class MagicLanternApp extends StatelessWidget {
  const MagicLanternApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الفانوس السحري والنقل الذكي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme), // 🟢 استخدام الحزمة المحدثة 9.0.0 بدون تعارض
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final NetworkService _networkService = NetworkService(); // 📡 تشغيل محرك الـ API
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    
    // 🚀 إطلاق فحص تسجيل الدخول والمحافظ عبر السيرفر السحابي ببلاش
    final result = await _networkService.loginUser(
      _phoneController.text,
      _passwordController.text,
    );

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result['message']),
        backgroundColor: result['success'] ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // 👑 الخلفية الملكية الفاخرة لعام 2026
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wb_incandescent_rounded, size: 80, color: Colors.amber), // 🌟 شعار الفانوس السحري منير
              const SizedBox(height: 16),
              const Text(
                'برنامج النقل الذكي والمحافظ الموحدة',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _phoneController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف (فودافون كاش)',
                  labelStyle: const TextStyle(color: Colors.amber),
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.amber)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'كلمة المرور المشفرة',
                  labelStyle: const TextStyle(color: Colors.amber),
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.amber)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 32),
              _isLoading
                  ? const CircularProgressIndicator(color: Colors.amber)
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      ),
                      child: const Text('تسجيل الدخول الآمن لايف 🚀', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}