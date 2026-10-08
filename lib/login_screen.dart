import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedAccountType = 'Customer';
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    // النظام يتعرف على نوع الحساب المختار ويفتح الواجهة المناسبة تلقائياً فوراً
    switch (_selectedAccountType) {
      case 'Customer': Navigator.pushReplacementNamed(context, '/passenger_home'); break;
      case 'Captain': Navigator.pushReplacementNamed(context, '/captain_home'); break;
      case 'Service Provider': Navigator.pushReplacementNamed(context, '/provider_home'); break;
      case 'Merchant': Navigator.pushReplacementNamed(context, '/merchant_home'); break;
      case 'Admin': Navigator.pushReplacementNamed(context, '/admin_home'); break;
      case 'Employee': Navigator.pushReplacementNamed(context, '/employee_home'); break;
      default: Navigator.pushReplacementNamed(context, '/passenger_home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1A24),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.brightness_5, size: 80, color: Color(0xFFD4AF37)),
              const SizedBox(height: 8),
              Text('الفانوس السحري', style: GoogleFonts.cairo(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 24),
              DropdownButtonFormField<String>(
                value: _selectedAccountType,
                dropdownColor: const Color(0xFF162534),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'نوع الحساب الرقمي', labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(12)),
                ),
                items: ['Customer', 'Captain', 'Service Provider', 'Merchant', 'Company', 'Employee', 'Admin']
                    .map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (v) => setState(() => _selectedAccountType = v!),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController, 
                style: const TextStyle(color: Colors.white), 
                decoration: InputDecoration(
                  hintText: 'رقم الهاتف', 
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.phone, color: Color(0xFFD4AF37)), 
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white10), borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController, 
                obscureText: true, 
                style: const TextStyle(color: Colors.white), 
                decoration: InputDecoration(
                  hintText: 'كلمة المرور', 
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFFD4AF37)), 
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white10), borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), minimumSize: const Size(double.infinity, 52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), 
                onPressed: _handleLogin, 
                child: Text('دخول 🚀', style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F1A24))),
              ),
              const SizedBox(height: 16),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text('إنشاء حساب جديد ✨', style: TextStyle(color: Color(0xFFD4AF37)))),
            ],
          ),
        ),
      ),
    );
  }
}