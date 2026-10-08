import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  final _carBrandController = TextEditingController();
  final _carModelController = TextEditingController();
  final _carColorController = TextEditingController();
  final _licenseExpiryController = TextEditingController();
  final _carLicenseExpiryController = TextEditingController();

  String _userType = 'Passenger'; 
  String _licenseType = 'خاصة'; 
  String _carType = 'ملاكي'; 
  bool _wantsInsurance = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _nationalIdController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _carBrandController.dispose();
    _carModelController.dispose();
    _carColorController.dispose();
    _licenseExpiryController.dispose();
    _carLicenseExpiryController.dispose();
    super.dispose();
  }

  Widget _buildUploadButton(String label, IconData icon, Color borderColor, Color fillColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 75,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xffe5c158), size: 24),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 11), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // تم إلغاء الـ const العلوي هنا لحسم تعارض السطر 95 بالكامل
    Color midnightBlue = const Color(0xff09111e);
    Color darkCard = const Color(0xff121f32);
    Color goldLantern = const Color(0xffe5c158);
    Color brightBlue = const Color(0xff0052cc);

    return Scaffold(
      backgroundColor: midnightBlue,
      appBar: AppBar(
        title: const Text('تسجيل مستخدم جديد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: darkCard,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: brightBlue),
            canvasColor: darkCard,
          ),
          child: Form(
            key: _formKey,
            child: Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep < 2) {
                  setState(() => _currentStep += 1);
                } else {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) setState(() => _currentStep -= 1);
              },
              steps: [
                Step(
                  title: const Text('نوع الحساب والبيانات الشخصية والصورة الحية', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  isActive: _currentStep >= 0,
                  content: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _userType,
                        dropdownColor: darkCard,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'اختر نوع الحساب',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'Passenger', child: Text('راكب (عميل)')),
                          DropdownMenuItem(value: 'Captain', child: Text('كابتن (سيارات / دليفري)')),
                          DropdownMenuItem(value: 'TransportProvider', child: Text('خدمات النقل والونش')),
                        ],
                        onChanged: (val) => setState(() {
                          _userType = val!;
                          _currentStep = 0;
                        }),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(labelText: 'الاسم رباعي (كما بالبطاقة)', labelStyle: TextStyle(color: Colors.grey)),
                        validator: (v) => v!.isEmpty ? 'الرجاء إدخال الاسم رباعي' : null,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(labelText: 'رقم الهاتف المحمول للتحقق', labelStyle: TextStyle(color: Colors.grey)),
                        validator: (v) => v!.isEmpty ? 'الرجاء إدخال رقم الهاتف' : null,
                      ),
                      TextFormField(
                        controller: _nationalIdController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(labelText: 'الرقم القومي للتحقق (14 رقم)', labelStyle: TextStyle(color: Colors.grey)),
                        validator: (v) => v!.length != 14 ? 'يجب إدخال الرقم القومي المكون من 14 رقماً' : null,
                      ),
                      TextFormField(
                        controller: _addressController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(labelText: 'محل الإقامة بالتفصيل', labelStyle: TextStyle(color: Colors.grey)),
                        validator: (v) => v!.isEmpty ? 'الرجاء تحديد العنوان الحالي' : null,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(labelText: 'أنشئ رقماً سرياً للدخول', labelStyle: TextStyle(color: Colors.grey)),
                        validator: (v) => v!.length < 6 ? 'كلمة المرور يجب ألا تقل عن 6 أحرف' : null,
                      ),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerRight, 
                        child: Text(
                          'التحقق الحي الصارم من ملامح الوجه لكل مستخدم:', 
                          style: TextStyle(color: goldLantern, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildUploadButton('التقط صورة سيلفي حية الآن ومطابقتها بالبطاقة الشخصية للتوثيق الإداري', Icons.add_a_photo, goldLantern, darkCard),
                      const SizedBox(height: 15),
                      const Align(alignment: Alignment.centerRight, child: Text('مستندات تحقيق الشخصية الموثقة:', style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _buildUploadButton('صورة البطاقة (الأمام)', Icons.badge_outlined, Colors.grey, darkCard)),
                          const SizedBox(width: 10),
                          Expanded(child: _buildUploadButton('صورة البطاقة (الخلف)', Icons.badge_outlined, Colors.grey, darkCard)),
                        ],
                      ),
                    ],
                  ),
                ),
                Step(
                  title: Text(
                    _userType == 'Passenger' ? 'خطوة تكميلية للعملاء' : 'بيانات الرخص والمركبة والتأمينات',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  isActive: _currentStep >= 1,
                  content: _userType == 'Passenger'
                      ? const Align(alignment: Alignment.centerRight, child: Text('اضغط استمرار لإكمال مراجعة الطلب ورفعه للإدارة للتوثيق.', style: TextStyle(color: Colors.grey, fontSize: 14)))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButtonFormField<String>(
                              value: _licenseType,
                              dropdownColor: darkCard,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(labelText: 'درجة رخصة القيادة الشخصية', labelStyle: TextStyle(color: Colors.grey)),
items: const [
DropdownMenuItem(value: 'خاصة', child: Text('رخصة خاصة')),
DropdownMenuItem(value: 'أولى', child: Text('درجة أولى')),
DropdownMenuItem(value: 'ثانية', child: Text('درجة ثانية')),
DropdownMenuItem(value: 'ثالثة', child: Text('درجة ثالثة')),
DropdownMenuItem(value: 'دراجة نارية', child: Text('رخصة قيادة درجة نارية')),
],
onChanged: (val) => setState(() => _licenseType = val!),
),
TextFormField(
controller: _licenseExpiryController,
style: const TextStyle(color: Colors.white),
decoration: const InputDecoration(hintText: 'مثال: 2030/12/30', labelText: 'تاريخ انتهاء رخصة القيادة (يدوي)', labelStyle: TextStyle(color: Colors.grey)),
validator: (v) => _userType != 'Passenger' && v!.isEmpty ? 'الرجاء كتابة تاريخ رخصة القيادة' : null,
),
const SizedBox(height: 15),
DropdownButtonFormField(
value: _carType,
dropdownColor: darkCard,
style: const TextStyle(color: Colors.white),
decoration: const InputDecoration(labelText: 'نوع المركبة / الخدمة والتشغيل للسيارات', labelStyle: TextStyle(color: Colors.grey)),
items: const [
DropdownMenuItem(value: 'ملاكي', child: Text('سيارات ملاكي')),
DropdownMenuItem(value: 'تاكسي', child: Text('تاكسي')),
DropdownMenuItem(value: 'نقل ثقيل', child: Text('نقل ثقيل')),
DropdownMenuItem(value: 'ربع نقل', child: Text('ربع نقل')),
DropdownMenuItem(value: 'نصف نقل', child: Text('نصف نقل')),
DropdownMenuItem(value: 'ونش إنقاذ', child: Text('ونش إنقاذ وسحب سيارات')),
],
onChanged: (val) => setState(() => _carType = val!),
),
TextFormField(
controller: _carBrandController,
style: const TextStyle(color: Colors.white),
decoration: const InputDecoration(labelText: 'اسم السيارة (ماركة المركبة المعتمدة)', labelStyle: TextStyle(color: Colors.grey)),
validator: (v) => _userType != 'Passenger' && v!.isEmpty ? 'الرجاء إدخال اسم السيارة' : null,
),
TextFormField(
controller: _carModelController,
style: const TextStyle(color: Colors.white),
decoration: const InputDecoration(labelText: 'موديل السيارة وسنة الصنع بالتفصيل', labelStyle: TextStyle(color: Colors.grey)),
validator: (v) => _userType != 'Passenger' && v!.isEmpty ? 'الرجاء تحديد الموديل' : null,
),
TextFormField(
controller: _carColorController,
style: const TextStyle(color: Colors.white),
decoration: const InputDecoration(labelText: 'لون السيارة الحالي كما بالرخصة', labelStyle: TextStyle(color: Colors.grey)),
validator: (v) => _userType != 'Passenger' && v!.isEmpty ? 'الرجاء تحديد لون السيارة' : null,
),
TextFormField(
controller: _carLicenseExpiryController,
style: const TextStyle(color: Colors.white),
decoration: const InputDecoration(hintText: 'مثال: 2028/05/14', labelText: 'تاريخ انتهاء رخصة السيارة (يدوي)', labelStyle: TextStyle(color: Colors.grey)),
validator: (v) => _userType != 'Passenger' && v!.isEmpty ? 'الرجاء كتابة تاريخ رخصة المركبة' : null,
),
const Divider(color: Colors.grey),
SwitchListTile(
title: const Text('تفعيل طلب الاشتراك الاختياري في التأمينات الاجتماعية كعامل حُر وعضو شبكة نقل الفانوس السحري', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
value: _wantsInsurance,
activeColor: goldLantern,
onChanged: (bool val) => setState(() => _wantsInsurance = val),
),
],
),
),
Step(
title: const Text('الشروط القانونية والتأكيد للامان', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
isActive: _currentStep >= 2,
content: _userType == 'Passenger'
? const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'يلتزم الراكب بشروط الأمان والرقابة الصارمة للمشاوير المباشرة وتتبع الخرائط وصحة الصورة الشخصية المرفوعة لمنع أي تجاوز قانوني أثناء البث الحي للرحلة.',
style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
),
],
)
: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Align(
alignment: Alignment.centerRight,
child: Text(
'المستندات والصور الفنية المطلوبة للفحص والتحقق الإداري:',
style: TextStyle(color: goldLantern, fontSize: 13, fontWeight: FontWeight.bold),
),
),
const SizedBox(height: 12),
Row(
children: [
Expanded(child: _buildUploadButton('صورة رخصة القيادة', Icons.portrait, brightBlue, darkCard)),
const SizedBox(width: 10),
Expanded(child: _buildUploadButton('صورة رخصة السيارة', Icons.drive_eta, brightBlue, darkCard)),
],
),
const SizedBox(height: 12),
const Text('صور زوايا الهيكل الأربعة للمركبة لتأكيد النظافة والسلامة الجسدية قبل التشغيل:', style: TextStyle(color: Colors.grey, fontSize: 12)),
const SizedBox(height: 10),
Row(
children: [
Expanded(child: _buildUploadButton('السيارة (أمام)', Icons.add_a_photo, darkCard, darkCard)),
const SizedBox(width: 8),
Expanded(child: _buildUploadButton('السيارة (خلف)', Icons.add_a_photo, darkCard, darkCard)),
],
),
const SizedBox(height: 8),
Row(
children: [
Expanded(child: _buildUploadButton('الجانب (يمين)', Icons.add_a_photo, darkCard, darkCard)),
const SizedBox(width: 8),
Expanded(child: _buildUploadButton('الجانب (يسار)', Icons.add_a_photo, darkCard, darkCard)),
],
),
],
),
),
],
),
),
),
),
);
}
}