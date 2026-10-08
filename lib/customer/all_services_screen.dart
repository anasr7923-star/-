import 'package:flutter/material.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  bool _isArabic = true;

  // هيكل الـ 19 قطاعاً وخدمة الأساسية لمنظومة الفانوس السحري المطابقة للمخطط بالملي
  final List<Map<String, dynamic>> _servicesData = [
    {
      "titleAr": "🚕 الرحلات والنقل",
      "titleEn": "🚕 Rides & Transport",
      "color": Colors.amber,
      "descAr": "سيارة، موتوسيكل، ربع نقل، ونش وسحب، مطار، مدارس",
      "descEn": "Car, Bike, Trucks, Towing, Airport, School trips",
    },
    {
      "titleAr": "🚚 نقل البضائع والأثاث",
      "titleEn": "🚚 Freight & Furniture",
      "color": Colors.orange,
      "descAr": "نقل أثاث، أجهزة، مواد بناء، شحن، فك وتركيب، تغليف",
      "descEn": "Furniture, Appliances, Logistics, Packing, Storage",
    },
    {
      "titleAr": "🚗 خدمات السيارات",
      "titleEn": "🚗 Auto Services",
      "color": Colors.blue,
      "descAr": "ميكانيكي، كهربائي، بطارية، تغيير زيت، ونش، غسيل، فحص",
      "descEn": "Mechanic, Electrician, Battery, Oil, Car Wash, Spare Parts",
    },
    {
      "titleAr": "🏠 خدمات المنزل",
      "titleEn": "🏠 Home Services",
      "color": Colors.indigo,
      "descAr": "سباكة، كهرباء، تكييف، نجارة، نقاشة، تنظيف، مكافحة حشرات",
      "descEn": "Plumbing, Electric, AC, Carpentry, Painting, Cleaning",
    },
    {
      "titleAr": "🛒 التسوق والتوصيل",
      "titleEn": "🛒 Shopping & Delivery",
      "color": Colors.green,
      "descAr": "سوبر ماركت، بقالة، خضار، لحوم، ملابس، إلكترونيات، هدايا",
      "descEn": "Groceries, Meat, Clothes, Electronics, Gifts, Baby items",
    },
    {
      "titleAr": "🍔 المطاعم والكافيهات",
      "titleEn": "🍔 Food & Dining",
      "color": Colors.red,
      "descAr": "وجبات، بيتزا، مشويات، مأكولات بحرية، حلويات، عصائر",
      "descEn": "Meals, Pizza, Grill, Seafood, Sweets, Cafes, Delivery",
    },
    {
      "titleAr": "💇 البيوتي سنتر والتجميل",
      "titleEn": "💇 Beauty & Spa",
      "color": Colors.pink,
      "descAr": "كوافير حريمي ورجالي، حلاق، عناية بالبشرة، حمام مغربي",
      "descEn": "Haircut, Skin Care, Makeup, Spa, Booking, Home service",
    },
    {
      "titleAr": "👗 تأجير الفساتين والملابس",
      "titleEn": "👗 Dress & Clothes Rental",
      "color": Colors.purple,
      "descAr": "فساتين زفاف وخطوبة وسواريه، بدلات رجالي، إكسسوارات",
      "descEn": "Wedding Dresses, Suits, Accessories, Size booking",
    },
    {
      "titleAr": "🚘 تأجير السيارات",
      "titleEn": "🚘 Car Rental",
      "color": Colors.cyan,
      "descAr": "إيجار بالساعة واليوم، سيارات اقتصادية وعائلية وفاخرة، بسائق",
      "descEn": "Hourly/Daily, Economy, Luxury, With or Without driver",
    },
    {
      "titleAr": "🏥 الطب والصحة",
      "titleEn": "🏥 Medical & Health",
      "color": Colors.teal,
      "descAr": "أطباء، عيادات، طبيب منزلي، تمريض، رعاية كبار السن، علاج طبيعي",
      "descEn": "Doctors, Home Visit, Nursing, Elderly Care, Physio",
    },
    {
      "titleAr": "💊 الصيدليات",
      "titleEn": "💊 Pharmacies",
      "color": Colors.redAccent,
      "descAr": "طلب دواء، رفع وتصوير الروشتة، توصيل، مستلزمات طبية وأطفال",
      "descEn": "Order Meds, Upload Prescription, Delivery, Baby Care",
    },
    {
      "titleAr": "🧪 معامل التحاليل",
      "titleEn": "🧪 Medical Labs",
      "color": Colors.deepPurple,
      "descAr": "تحاليل دم، سكر، وظائف كبد وكلى، هرمونات، سحب عينات من المنزل",
      "descEn": "Blood tests, Liver/Kidney functions, Home sample extraction",
    },
    {
      "titleAr": "🩻 الأشعة",
      "titleEn": "🩻 Radiology Center",
      "color": Colors.blueGrey,
      "descAr": "X-Ray, CT, MRI, سونار، دوبلر، إيكو، خدمات منزلية متاحة",
      "descEn": "X-Ray, CT, MRI, Ultrasound, Echo, Home service available",
    },
    {
      "titleAr": "🧱 البناء والتشطيب",
      "titleEn": "🧱 Construction & Finishing",
      "color": Colors.brown,
      "descAr": "مهندس، مقاول، تصميم، مباني، دهانات، سيراميك، مواد بناء، عمالة",
      "descEn": "Engineer, Contractor, Design, Paints, Tiles, Materials",
    },
    {
      "titleAr": "📦 الشحن والطرود",
      "titleEn": "📦 Shipping & Parcels",
      "color": Colors.orangeAccent,
      "descAr": "طرود، مستندات، هدايا، توصيل بين المحافظات وللشركات",
      "descEn": "Parcels, Documents, Gifts, Inter-city delivery, Corporate",
    },
    {
      "titleAr": "✈️ السفر والتنقل السياحي",
      "titleEn": "✈️ Travel & Tourism",
      "color": Colors.lightBlue,
      "descAr": "استقبال وتوصيل للمطار، محطات القطار والأتوبيس، انتقالات سياحية",
      "descEn": "Airport pickups, Train station, Tourist transport, Trips",
    },
    {
      "titleAr": "🏢 خدمات الشركات",
      "titleEn": "🏢 Corporate Services",
      "color": Colors.indigoAccent,
      "descAr": "نقل موظفين، نقل مكاتب، صيانة ونظافة، عقود خدمات وفواتير دورية",
      "descEn": "Employee transport, Office moving, Cleaning, Contracts",
    },
    {
      "titleAr": "🐕 الحيوانات الأليفة",
      "titleEn": "🐕 Pet Care",
      "color": Colors.lime,
      "descAr": "طبيب بيطري، صيدلية بيطرية، مستلزمات، تنظيف، زيارات منزلية",
      "descEn": "Vet Doctor, Pet Pharmacy, Supplies, Grooming, Home visit",
    },
    {
      "titleAr": "👨‍💼 الخدمات المهنية",
      "titleEn": "👨‍💼 Professional Services",
      "color": Colors.deepOrange,
      "descAr": "محامي، محاسب، مصمم، مبرمج، تصوير وفيديو، طباعة، تسويق",
      "descEn": "Lawyer, Accountant, Designer, Dev, Media, Print, Marketing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          _isArabic ? '🏮 الفانوس السحري - كل الخدمات' : '🏮 Magic Lantern - All Services',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => setState(() => _isArabic = !_isArabic),
            child: Text(
              _isArabic ? 'English' : 'العربية',
              style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10, 
            mainAxisSpacing: 10, 
            childAspectRatio: 1.15,
          ),
          itemCount: _servicesData.length,
          itemBuilder: (context, index) {
            var sector = _servicesData[index];
            return Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isArabic 
                          ? '🎯 جاري فتح رادار قطاع: ${_servicesData[index]["titleAr"]}...' 
                          : '🎯 Launching Radar for: ${_servicesData[index]["titleEn"]}...'
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: (sector["color"] as Color).withAlpha(30),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.stars, color: sector["color"], size: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isArabic ? sector["titleAr"]! : sector["titleEn"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1E293B)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          _isArabic ? sector["descAr"]! : sector["descEn"]!,
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 10, height: 1.3),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}