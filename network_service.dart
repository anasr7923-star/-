import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  // 🔐 بيانات المخ السحابي المركزي والخادم الحقيقي مالتك بالملي
  static const String baseUrl = 'https://clever-cloud.com';
  static const String databaseName = 'bd9exha0bee6skkaeldx';
  static const String username = 'uzt0rkqh1agmdlqe';
  static const String serverPort = '3306';

  // 1. محرك التحقق وتسجيل دخول المستخدمين والكباتن حياً بالثانية
  Future<Map<String, dynamic>> loginUser(String phone, String password) async {
    final url = Uri.parse('$baseUrl/api/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phone_number': phone,
          'password': password,
          'database': databaseName,
          'user': username,
          'port': serverPort,
        }),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'تم تسجيل الدخول بنجاح والربط بالسيرفر السحابي'
        };
      } else {
        return {
          'success': false,
          'message': 'خطأ في بيانات الدخول: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'فشل الاتصال بالمخ المركزي: $e'
      };
    }
  }

  // 2. محرك إدارة الخزنة ومحافظ فودافون كاش والفيزا الموحدة
  Future<Map<String, dynamic>> checkWalletBalance(String userId) async {
    final url = Uri.parse('$baseUrl/api/wallet/balance?user_id=$userId&db=$databaseName');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return {
          'success': true,
          'balance': jsonDecode(response.body)['balance'],
          'wallet_type': 'Operating_Wallet'
        };
      } else {
        return {'success': false, 'message': 'فشل جلب رصيد المحفظة المالية'};
      }
    } catch (e) {
      return {'success': false, 'message': 'تعذر الاتصال بخزنة فودافون كاش: $e'};
    }
  }

  // 3. رادار تتبع الـ GPS وإرسال إحداثيات جلسات الكباتن لايف
  Future<bool> updateCaptainLocation(String captainId, double lat, double lng) async {
    final url = Uri.parse('$baseUrl/api/radar/update-location');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'captain_id': captainId,
          'last_latitude': lat.toString(),
          'last_longitude': lng.toString(),
          'db_target': databaseName
        }),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('عطل حركي في بث الرادار الجغرافي: $e');
      return false;
    }
  }
}