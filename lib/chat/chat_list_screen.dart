import 'package:flutter/material.dart';
import 'chat_screen.dart'; // إستدعاء مباشر وصحيح للغرفة الداخلية

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final bool _isArabic = true;

  // محاكاة حية لصندوق الرسائل الواردة لطلبات الفانوس السحري
  final List<Map<String, dynamic>> _activeChats = [
    {
      "name": "كابتن/ محمد أحمد (فني معتمد)",
      "sector": "🔧 قطاع الصيانة - سباكة",
      "lastMsg": "أنا في الطريق إليك الآن وسأصل خلال دقائق بحسب الرادار.",
      "time": "10:35 م",
      "unread": 2,
    },
    {
      "name": "مهندس/ أحمد علي (أخصائي تكييف)",
      "sector": "❄️ قطاع التبريد والتكييف",
      "lastMsg": "تم فحص وحدة التبريد وجاري تركيب الفلتر الجديد.",
      "time": "أمس",
      "unread": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          _isArabic ? '💬 صندوق المحادثات والرسائل' : '💬 Messages Inbox',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: _activeChats.length,
          itemBuilder: (context, index) {
            var chat = _activeChats[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 1,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFF1E293B),
                  child: Icon(Icons.person, color: Colors.amber, size: 20),
                ),
                title: Text(chat["name"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(chat["lastMsg"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(chat["sector"], style: const TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.w500)),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(chat["time"], style: const TextStyle(color: Colors.grey, fontSize: 10)),
                    const SizedBox(height: 6),
                    if (chat["unread"] > 0)
                      CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.red.shade600,
                        child: Text('${chat["unread"]}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                  ],
                ),
                onTap: () {
                  // 🎯 انتقال حركي آمن ومصفّر لغرفة الشات الداخلية عند النقر
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}