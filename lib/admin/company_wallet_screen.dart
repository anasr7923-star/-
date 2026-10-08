import 'package:flutter/material.dart';

class CompanyWalletScreen extends StatefulWidget {
  const CompanyWalletScreen({super.key});

  @override
  State<CompanyWalletScreen> createState() => _CompanyWalletScreenState();
}

class _CompanyWalletScreenState extends State<CompanyWalletScreen> {
  bool _isArabic = true;

  // دفاتر أموال الشركة الصافية (Ledger Isolated Ledger)
  final double _platformBalance = 125750.0;
  final double _todayGains = 8450.0;
  final double _monthGains = 72300.0;

  // سجل المعاملات الحقيقية المحمي من التعديل
  final List<Map<String, dynamic>> _companyLedger = [
    {"date": "29/09/2026", "desc": "عمولة رحلات قطاع النقل الذكي", "val": "+1,250", "ok": true},
    {"date": "29/09/2026", "desc": "عمولة توصيل طرود السوبرماركت", "val": "+650", "ok": true},
    {"date": "29/09/2026", "desc": "تحويل بنكي لأرباح الإدارة (IBAN)", "val": "-10,000", "ok": false},
    {"date": "29/09/2026", "desc": "عمولة كشوفات الزيارات الطبية", "val": "+900", "ok": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(
          _isArabic ? '💰 الحساب المالي المفتوح للشركة' : '💰 Company Platform Wallet',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => setState(() => _isArabic = !_isArabic),
            child: Text(_isArabic ? 'English' : 'العربية', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // كرت الرصيد المتاح للتحويل
              Card(
                color: const Color(0xFF0F172A),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(_isArabic ? 'الرصيد المتاح حالياً للشركة' : 'Platform Available Balance', style: const TextStyle(color: Colors.white60, fontSize: 13)),
                      const SizedBox(height: 8),
                      Text('${_platformBalance.toStringAsFixed(2)} ${_isArabic ? "ج.م" : "EGP"}', style: const TextStyle(color: Colors.amber, fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: _buildMiniCard(_isArabic ? 'أرباح اليوم' : 'Today Gains', '+${_todayGains.toStringAsFixed(0)} ج', Colors.green)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildMiniCard(_isArabic ? 'أرباح الشهر' : 'Month Gains', '+${_monthGains.toStringAsFixed(0)} ج', Colors.blue)),
                ],
              ),
              const SizedBox(height: 24),

              Text(_isArabic ? '📜 سجل الحساب المحمي للعمليات المالية' : '📜 Secured Platform Revenue Log', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _companyLedger.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    var item = _companyLedger[index];
                    return ListTile(
                      title: Text(item["desc"], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      subtitle: Text(item["date"], style: const TextStyle(fontSize: 11, color: Colors.grey)),
                      trailing: Text('${item["val"]} ج', style: TextStyle(fontWeight: FontWeight.bold, color: item["ok"] ? Colors.green.shade700 : Colors.red.shade700)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiniCard(String title, String val, Color col) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 6),
            Text(val, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: col)),
          ],
        ),
      ),
    );
  }
}