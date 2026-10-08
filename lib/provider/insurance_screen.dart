import 'package:flutter/material.dart';

class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({super.key});

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  bool _isArabic = true;

  // الدفتر التأميني المعزول والمحاكي لقانون التأمين الاجتماعي للكابتن
  final double _monthlyRequired = 900.0;
  final double _collectedFromTrips = 620.0;

  @override
  Widget build(BuildContext context) {
    double remainingBalance = _monthlyRequired - _collectedFromTrips;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(
          _isArabic ? '🛡️ حساب التغطية والتأمينات الشهرية' : '🛡️ Insurance Ledger Status',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_isArabic ? 'الحالة الجارية لهذا الشهر:' : 'Current Statement Status:', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: remainingBalance <= 0 ? Colors.green.shade100 : Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              remainingBalance <= 0 ? (_isArabic ? '🟢 مكتمل السداد' : '🟢 Settled') : (_isArabic ? '🟠 لم يكتمل السداد' : '🟠 Pending'),
                              style: TextStyle(color: remainingBalance <= 0 ? Colors.green.shade800 : Colors.amber.shade800, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      _buildRowData(_isArabic ? 'المطلوب للتأمينات شهرياً:' : 'Target required amount:', '$_monthlyRequired ج.م', Colors.black87),
                      _buildRowData(_isArabic ? 'تم تحصيله تراكمياً من الرحلات:' : 'Collected automatically:', '$_collectedFromTrips ج.م', Colors.green.shade700),
                      _buildRowData(_isArabic ? 'المتبقي المستحق للتسوية:' : 'Remaining for settlement:', '${remainingBalance > 0 ? remainingBalance : 0} ج.م', remainingBalance > 0 ? Colors.red : Colors.green),
                      if (remainingBalance > 0) ...[
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent.shade700, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          icon: const Icon(Icons.payment, color: Colors.white),
                          label: Text(_isArabic ? '💳 شحن وتأدية حساب التأمينات مباشرة' : '💳 Top-up Insurance Direct Account', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowData(String label, String val, Color col) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(val, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: col)),
        ],
      ),
    );
  }
}