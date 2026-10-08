import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isArabic = true;
  final TextEditingController _msgController = TextEditingController();
  
  // سجل الرسائل الحية المتبادلة المشفرة بين العميل ومقدم الخدمة
  final List<Map<String, dynamic>> _conversation = [
    {"text": "مرحباً بك يا فندم، أنا كابتن محمد المسؤول عن طلب السباكة الخاص بك.", "isMe": false, "time": "10:30 م"},
    {"text": "أهلاً بك يا كابتن، يرجى إحضار خلاط مياه جديد لأن التسريب كثيف أسفل الحوض.", "isMe": true, "time": "10:32 م"},
    {"text": "تم تماماً، أنا قمت بشرائه بالفعل وفي الطريق إليك الآن بحسب مسار الخريطة.", "isMe": false, "time": "10:35 م"},
  ];

  void _handleSend() {
    if (_msgController.text.trim().isEmpty) return;
    setState(() {
      _conversation.add({
        "text": _msgController.text.trim(),
        "isMe": true,
        "time": "10:40 م",
      });
      _msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Column(
          children: [
            Text(
              _isArabic ? '💬 غرف المحادثة الفورية' : '💬 Live Chat Gateway',
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
            ),
            Text(
              _isArabic ? 'قناة اتصال مشفرة ومؤمنة بالكامل' : 'End-to-End Encrypted Channel',
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            // ─── مساحة عرض فقاعات الرسائل (Chat Bubbles) ───
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _conversation.length,
                itemBuilder: (context, index) {
                  var message = _conversation[index];
                  bool isMe = message["isMe"];
                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isMe ? const Color(0xFF0F172A) : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(14),
                          topRight: const Radius.circular(14),
                          bottomLeft: isMe ? const Radius.circular(14) : const Radius.circular(0),
                          bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(14),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 2, offset: const Offset(0, 1))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            message["text"],
                            style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 13.5),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            message["time"],
                            style: TextStyle(color: isMe ? Colors.white60 : Colors.grey.shade500, fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // ─── شريط المعاينة التفاعلية وإرسال صور الأعطال للرادار ───
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              color: Colors.white,
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.blueGrey, size: 24),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(_isArabic ? '📷 جاري تفعيل الكاميرا لالتقاط وإرفاق صور العطل للفني...' : '📷 Opening camera to attach photo...')),
                        );
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _msgController,
                        decoration: InputDecoration(
                          hintText: _isArabic ? 'اكتب رسالتك هنا للتحرك فوراً...' : 'Type your message...',
                          hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide(color: Colors.grey.shade300)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          filled: true,
                          fillColor: const Color(0xFFF8FAFC),
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: const Color(0xFF0F172A),
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white, size: 16),
                        onPressed: _sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_msgController.text.trim().isEmpty) return;
    setState(() {
      _conversation.add({
        "text": _msgController.text.trim(),
        "isMe": true,
        "time": "10:42 م",
      });
      _msgController.clear();
    });
  }

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }
}