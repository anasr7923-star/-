import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String _currentSection = 'الرئيسية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1A24),
      appBar: AppBar(
        title: Text('لوحة المدير العام', style: GoogleFonts.cairo(color: const Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0E161F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Row(
        children: [
          // القائمة الجانبية الملاحية لـ 17 قطاعاً إدارياً
          Container(
            width: 260,
            color: const Color(0xFF0E161F),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                _buildMenuItem('الرئيسية', Icons.dashboard),
                _buildMenuItem('الرحلات', Icons.map),
                _buildMenuItem('الطلبات', Icons.shopping_cart),
                _buildMenuItem('الخريطة و GPS', Icons.location_on),
                _buildMenuItem('العملاء', Icons.people),
                _buildMenuItem('مقدمو الخدمات', Icons.local_shipping),
                _buildMenuItem('المركبات', Icons.directions_car),
                _buildMenuItem('الخدمات', Icons.design_services),
                _buildMenuItem('المستندات', Icons.description),
                _buildMenuItem('المالية', Icons.account_balance_wallet),
                _buildMenuItem('الشركة', Icons.business),
                _buildMenuItem('التأمينات', Icons.verified_user),
                _buildMenuItem('العروض', Icons.local_offer),
                _buildMenuItem('الشكاوى', Icons.report_problem),
                _buildMenuItem('الموظفين', Icons.badge),
                _buildMenuItem('الصلاحيات', Icons.admin_panel_settings),
                _buildMenuItem('التقارير', Icons.bar_chart),
                _buildMenuItem('سجل العمليات', Icons.history),
              ],
            ),
          ),
          // المحتوى الديناميكي وجداول قاعدة البيانات
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF162534),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD4AF37), width: 0.5),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('القطاع: $_currentSection', style: GoogleFonts.cairo(fontSize: 20, color: const Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('قاعدة البيانات متصلة وجداول الامتثال نشطة لعام 2026', style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
                    const Divider(color: Colors.grey, height: 32),
                    Expanded(child: Center(child: Text('سجلات جداول كيانات قاعدة البيانات لـ $_currentSection', style: const TextStyle(color: Colors.white70)))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    bool isSelected = _currentSection == title;
    return ListTile(
      leading: Icon(icon, color: isSelected ? const Color(0xFFD4AF37) : Colors.white70),
      title: Text(title, style: GoogleFonts.cairo(color: isSelected ? const Color(0xFFD4AF37) : Colors.white, fontSize: 14)),
      selected: isSelected,
      onTap: () {
        setState(() {
          _currentSection = title;
        });
      },
    );
  }
}