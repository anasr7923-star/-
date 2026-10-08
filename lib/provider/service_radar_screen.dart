import 'package:flutter/material.dart';

class ServiceRadarScreen extends StatefulWidget {
  const ServiceRadarScreen({super.key});

  @override
  State<ServiceRadarScreen> createState() => _ServiceRadarScreenState();
}

class _ServiceRadarScreenState extends State<ServiceRadarScreen> {
  bool _isArabic = true;

  // بيانات المحرك المطابقة للـ Service Match المفلترة جغرافياً عبر السيرفر
  final String _serviceTitleAr = "🔧 قطاع الخدمات المنزلية - سباكة (إصلاح تسريب مياه)";
  final String _serviceTitleEn = "🔧 Home Services - Plumbing (Fixing Water Leak)";
  final String _gpsZoneAr = "الإسكندرية، سيدي بشر (على بعد 2.4 كم)";
  final String _gpsZoneEn = "Alexandria, Sidi Bishr (2.4 KM away)";
  
  double _myBidPrice = 850.0;
  int _etaMinutes = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          _isArabic ? '📡 رادار استقبال وتصفية الطلبات' : '📡 Intelligent Provider Radar',
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
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.green, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(_isArabic ? '🟢 طلب رادار جديد مطابق' : '🟢 New Matching Order', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                            backgroundColor: Colors.green.shade600,
                          ),
                          const Text('↔ 2.4 KM', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                        ],
                      ),
                      const Divider(height: 24),
                      Text(_isArabic ? 'الخدمة المطلوبة بحسب تخصصك الحالي:' : 'Requested Specialized Service:', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(_isArabic ? _serviceTitleAr : _serviceTitleEn, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text(_isArabic ? 'موقع العميل الجغرافي المفلتر:' : 'Client GPS geofenced Location:', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(_isArabic ? _gpsZoneAr : _gpsZoneEn, style: const TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 12),
                      Text(_isArabic ? 'وصف المطلوب من العميل:' : 'Task Requirement Details:', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      // 🚀 تم استبدال الـ slate600 المعطل بلون مدمج مصحح هنا لتصفير الأخطاء
                      Text(_isArabic ? 'يوجد تسريب مياه كثيف أسفل حوض المطبخ يتطلب معالجة وإصلاح فوري.' : 'Severe water leak under the kitchen sink requiring immediate repair.', style: TextStyle(color: Colors.grey.shade700, height: 1.4)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.image, color: Colors.blue, size: 16),
                          const SizedBox(width: 4),
                          Text(_isArabic ? '📷 تم إرفاق عدد 2 صور لمعاينة العطل برمجياً' : '📷 2 Attached Photos for structural inspection', style: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(_isArabic ? '💰 تقديم قيمة عرض السعر التنافسي للعميل' : '💰 Submit Proposed Bid Offer', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_isArabic ? 'مبلغ العرض (ج.م):' : 'Offer Amount (EGP):'),
                          Row(
                            children: [
                              IconButton(onPressed: () => setState(() => _myBidPrice -= 50), icon: const Icon(Icons.remove_circle, color: Colors.red)),
                              Text('${_myBidPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
                              IconButton(onPressed: () => setState(() => _myBidPrice += 50), icon: const Icon(Icons.add_circle, color: Colors.green)),
                            ],
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_isArabic ? '⏱️ مدة الوصول المقدرة (دقيقة):' : 'Estimated Arrival Duration (Mins):'),
                          Row(
                            children: [
                              IconButton(onPressed: () => setState(() { if (_etaMinutes > 15) _etaMinutes -= 15; }), icon: const Icon(Icons.remove_circle_outline)),
                              Text('$_etaMinutes', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              IconButton(onPressed: () => setState(() { if (_etaMinutes < 90) _etaMinutes += 15; }), icon: const Icon(Icons.add_circle_outline)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_isArabic ? '🚀 تم بث عرض السعر الخاص بك لمحرك الفانوس السحري بنجاح!' : '🚀 Offer broadcasted to the Matching Engine successfully!'))),
                        child: Text(_isArabic ? 'إرسال عرض السعر الفوري 📩' : 'Submit Offer Code 📩', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}