import 'package:flutter/material.dart';
import 'network_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _networkService = NetworkService();
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    final result = await _networkService.loginUser(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    setState(() => _isLoading = false);

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تسجيل الدخول بنجاح! جاري فتح الرادار...')),
      );
      // هنا ينطلق التوجيه التلقائي للـ Dashboard ورادار الـ GPS
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('خطأ في البيانات أو عطل بالاتصال!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDE7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.flash_on, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              const Text(
                'تسجيل الدخول - الفانوس السحري',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.amber),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.amber),
                ),
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.amber))
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('دخول الكابتن / الركاب', style: TextStyle(fontSize: 18, color: Colors.black)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
