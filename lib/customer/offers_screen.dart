import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  bool _isArabic = true;

  // محاكاة لعروض الأسعار التنافسية المستلمة لطلب العميل حياً من السيرفر
  final List<Map<String, dynamic>> _receivedBids = [
    {
      "provider": "كابتن/ محمد أحمد (سباك معتمد)",
      "rating": 4.8,
      "price": 850,
      "time": "45 دقيقة",
      "duration": "ساعتان",
      "notes": "السعر يشمل التركيب والضمان الفني لمدة أسبوع بالكامل"
    },
    {
      "provider": "مهندس/ أحمد علي (أخصائي صيانة)",
      "rating": 4.6,
      "price": 700,
      "time": "ساعة واحدة",
      "duration": "ساعة ونصف",
      "notes": "السعر يشمل الفحص الشامل والتركيب فقط بدون قطع الغيار"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // ألوان أصلية مستقرة تمنع الخطأ الأحمر
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(
          _isArabic ? '🔧 عروض الأسعار المستلمة لطلبك' : '🔧 Received Service Offers',
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
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _receivedBids.length,
          itemBuilder: (context, index) {
            var offer = _receivedBids[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16), // تصحيح الاستدعاء لتفادي خطأ EdgeInsets.bottom
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(offer["provider"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text('${offer["rating"]}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${_isArabic ? "💰 السعر المقترح:" : "💰 Price:"} ${offer["price"]} ج.م', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('${_isArabic ? "⏱️ زمن الوصول:" : "⏱️ Arrival:"} ${offer["time"]}', style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('${_isArabic ? "⏳ مدة التنفيذ المقدرة:" : "⏳ Execution:"} ${offer["duration"]}', style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
                    Text('${_isArabic ? "📝 ملاحظات الفني:" : "📝 Notes:"} ${offer["notes"]}', style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.4)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600, padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_isArabic ? '✅ تم اعتماد العرض وتوجيه الفني لعنوانك حياً!' : '✅ Offer accepted! Dispatching provider.'))),
                      child: Text(_isArabic ? 'اختيار واعتماد هذا العرض 🟢' : 'Accept This Offer 🟢', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}