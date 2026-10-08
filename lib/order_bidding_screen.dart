import 'package:flutter/material.dart';

class OrderBiddingScreen extends StatefulWidget {
  const OrderBiddingScreen({super.key});

  @override
  State<OrderBiddingScreen> createState() => _OrderBiddingScreenState();
}

class _OrderBiddingScreenState extends State<OrderBiddingScreen> {
  bool _isArabic = true;
  bool _isProviderView = true; 

  final String _currentServiceAr = "🔧 سباكة (إصلاح تسريب مياه)";
  final String _currentServiceEn = "🔧 Plumbing (Fixing Water Leak)";
  final String _zoneAr = "الإسكندرية، سيدي بشر";
  final String _zoneEn = "Alexandria, Sidi Bishr";
  
  double _myOfferPrice = 850.0;
  int _arrivalTime = 45;
  int _executionTime = 2;

  final List<Map<String, dynamic>> _incomingOffers = [
    {"provider": "مقدم الخدمة 1 (محمد - سباك معتمد)", "rating": 4.8, "price": 850, "time": "45 دقيقة", "notes": "السعر يشمل التركيب فقط"},
    {"provider": "مقدم الخدمة 2 (أحمد - أخصائي صيانة)", "rating": 4.6, "price": 700, "time": "ساعة واحدة", "notes": "جاهز للتحرك الفوري وضمان أسبوع"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(
          _isArabic ? 'محرك الرادار وعروض الأسعار الموحد' : 'Unified Radar & Offers Engine',
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: _isProviderView ? Colors.blue : Colors.blueGrey.shade700),
              onPressed: () => setState(() => _isProviderView = true),
              icon: const Icon(Icons.engineering, color: Colors.white, size: 16),
              label: Text(_isArabic ? 'رادار الفني' : 'Provider Radar', style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: !_isProviderView ? Colors.green : Colors.blueGrey.shade700),
              onPressed: () => setState(() => _isProviderView = false),
              icon: const Icon(Icons.person, color: Colors.white, size: 16),
              label: Text(_isArabic ? 'عروض العميل' : 'Client Offers', style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: _isProviderView ? _buildProviderRadarView() : _buildClientOffersView(),
        ),
      ),
    );
  }

  Widget _buildProviderRadarView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.green, width: 1.5)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.radio_button_checked, color: Colors.green, size: 16),
                        const SizedBox(width: 6),
                        Text(_isArabic ? '📡 طلب رادار جديد مطابق' : '📡 New Matching Request', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                      ],
                    ),
                    const Chip(label: Text('↔ 2.4 كم', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)), backgroundColor: Color(0xFFF1F5F9)),
                  ],
                ),
                const Divider(height: 24),
                Text(_isArabic ? 'نوع الخدمة والقطاع:' : 'Service Sector:', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text(_isArabic ? _currentServiceAr : _currentServiceEn, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(_isArabic ? 'نطاق الموقع الجغرافي:' : 'Geofenced Location:', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text(_isArabic ? _zoneAr : _zoneEn, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
                Text(_isArabic ? 'تفاصيل العميل والمطلوب:' : 'Client Request Notes:', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text(_isArabic ? 'يرجى إصلاح تسريب مياه مفاجئ في خلاط المطبخ الرئيسي.' : 'Please repair a sudden water leak in the kitchen mixer.', style: const TextStyle(color: Colors.black87)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.image, color: Colors.blue, size: 16),
                    const SizedBox(width: 4),
                    Text(_isArabic ? '📷 عدد 2 صور مرفقة لمعاينة العطل' : '📷 2 Attached Photos for Inspection', style: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w500)),
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
                Text(_isArabic ? '💰 تقديم عرض السعر والمواعيد المقررة للعميل' : '💰 Set Price & Delivery Metrics', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_isArabic ? 'مبلغ العرض المقترح (ج.م):' : 'Offer Price (EGP):'),
                    Row(
                      children: [
                        IconButton(onPressed: () => setState(() => _myOfferPrice -= 50), icon: const Icon(Icons.remove_circle, color: Colors.red)),
                        Text('${_myOfferPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                        IconButton(onPressed: () => setState(() => _myOfferPrice += 50), icon: const Icon(Icons.add_circle, color: Colors.green)),
                      ],
                    )
                  ],
                ),
                const Divider(),
                _buildSliderLogistics(_isArabic ? '⏱️ مدة الوصول للكائن (دقيقة):' : 'Arrival Time (Min):', _arrivalTime.toDouble(), 15, 90, (val) => setState(() => _arrivalTime = val.toInt())),
                _buildSliderLogistics(_isArabic ? '⏳ مدة التنفيذ المقدرة (ساعة):' : 'Execution Duration (Hrs):', _executionTime.toDouble(), 1, 6, (val) => setState(() => _executionTime = val.toInt())),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_isArabic ? '🚀 تم بث عرض السعر الخاص بك لمحرك الطلب وجاري انتظار موافقة العميل!' : '🚀 Offer broadcasted to the client successfully!'))),
                  child: Text(_isArabic ? 'إرسال العرض المقفل للعميل 📩' : 'Submit Offer to Client 📩', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildClientOffersView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.local_offer, color: Colors.blue),
            const SizedBox(width: 8),
            Text(_isArabic ? '🔧 عروض الأسعار المستلمة لطلبك' : '🔧 Service Price Offers Received', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _incomingOffers.length,
          itemBuilder: (context, index) {
            var offer = _incomingOffers[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(offer["provider"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Row(
                          children: [
const Icon(Icons.star, color: Colors.amber, size: 16),
const SizedBox(width: 4),
Text('${offer["rating"]}', style: const TextStyle(fontWeight: FontWeight.bold)),
],
)
],
),
const Divider(height: 20),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text('${_isArabic ? "💰 السعر المقترح:" : "💰 Proposed Price:"} ${offer["price"]} ج.م', style: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.bold, fontSize: 16)),
Text('${_isArabic ? "⏱️ يصل خلال:" : "⏱️ Arrival:"} ${offer["time"]}', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
],
),
const SizedBox(height: 8),
Text('${_isArabic ? "📝 الشروط:" : "📝 Terms:"} ${offer["notes"]}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
const SizedBox(height: 14),
ElevatedButton(
style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_isArabic ? '✅ تم اختيار العرض! جاري إرسال رقم كود المعاملة وتوجيه الفني لعنوانك.' : '✅ Offer Chosen! Directing provider to your address.'))),
child: Text(_isArabic ? 'اختيار وتأكيد هذا العرض 🟢' : 'Select & Confirm Offer 🟢', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
)
],
),
),
);
},
)
],
);
}
Widget _buildSliderLogistics(String label, double val, double min, double max, ValueChanged onChanged) {
return Padding(
padding: const EdgeInsets.symmetric(vertical: 6.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
Text('${val.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
],
),
Slider(min: min, max: max, value: val, onChanged: onChanged),
],
),
);
}
}