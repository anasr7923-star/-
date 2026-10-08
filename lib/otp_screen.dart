import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final bool _isArabic = true;
  final TextEditingController _otpFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          _isArabic ? '🔐 تأكيد كود الحساب الموحد' : '🔐 Verify OTP Security Code',
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.lock_person, size: 72, color: Colors.amber),
              const SizedBox(height: 20),
              Text(
                _isArabic 
                    ? 'أدخل كود التحقق السري المكون من 4 أرقام المرسل لهاتفك الحين للتأكيد من حماية الهوية الجغرافية:' 
                    : 'Enter the 4-digit security code sent to your phone for geofenced identity verification:',
                style: const TextStyle(fontSize: 13.5, color: Colors.grey, height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              // حقل إدخال الرمز السري المشفر (4 خانات مقفلة بالمسطرة)
              TextField(
                controller: _otpFieldController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 12),
                maxLength: 4,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: '0000',
                  hintStyle: const TextStyle(color: Colors.grey, letterSpacing: 0),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                ),
              ),
              const SizedBox(height: 24),

              // زر الفحص والمطابقة البرمجية التلقائية
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (_otpFieldController.text == "1234") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(_isArabic ? '✅ تم التحقق من الهوية بنجاح، جاري فتح بوابة الفانوس السحري...' : '✅ OTP Verified successfully!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(_isArabic ? '❌ رمز التحقق غير صحيح، يرجى مراجعة الرسالة والمحاولة ثانياً.' : '❌ Invalid OTP security code.')),
                    );
                  }
                },
                icon: const Icon(Icons.shield, color: Colors.white, size: 18),
                label: Text(
                  _isArabic ? 'تأكيد الرمز والدخول للمنظومة' : 'Verify & Launch App',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpFieldController.dispose();
    super.dispose();
  }
}