import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class NetworkService {
  // 🌐 البيانات الرسمية الحية المستخرجة بالملي من سيرفرك السحابي الحين
  static const String _host = "://clever-cloud.com";
  static const String _port = "3306";
  static const String _dbName = "bd9exha0bee6skxaeldx";
  static const String _user = "uzf0kgh1agmdiqxf";
  static const String _pass = "1D200207237";

  // 🚀 بوابات الـ API الموحدة لربط التطبيق والمحفظة الرقمية
  static const String baseUrl = "https://://clever-cloud.com/api";

  late IOClient _client;

  NetworkService() {
    // 🔐 شفرة الالتفاف لتخطي جدار الـ SSL بنجاح وبدون اعتراض على هواتف الأندرويد
    final HttpClient httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    _client = IOClient(httpClient);
  }

  // 📝 كود تسجيل مستخدم جديد أو كابتن وتوثيقه في قاعدة البيانات السحابية
  Future<bool> registerUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String role, // 'driver' أو 'passenger'
  }) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'role': role,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print("خطأ في الاتصال بقاعدة بيانات Clever Cloud: $e");
      return false;
    }
  }

  // 💳 كود تحديث رصيد المحفظة الرقمية للكباتن والركاب لايف بالثانية
  Future<double?> getWalletBalance(String userId) async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/wallet/balance?userId=$userId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return double.tryParse(data['balance'].toString()) ?? 0.0;
      }
      return null;
    } catch (e) {
      print("عطل في قراءة رصيد المحفظة السحابية: $e");
      return null;
    }
  }
}