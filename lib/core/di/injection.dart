
                            //1




import 'package:get_it/get_it.dart'; // استيراد مكتبة الحاوية (المخزن)
import 'package:injectable/injectable.dart'; // استيراد مكتبة المولد الذكي
import 'injection.config.dart'; // ⚠️ هذا الملف سيتم توليده أوتوماتيكياً، لا تقلق من الخط الأحمر حالياً

// 1️⃣ إنشاء نسخة من "المخزن" (Service Locator)
// GetIt هو المكان اللي هنخزن فيه كل الكلاسات بتاعتنا (Singleton) عشان نستخدمها في أي مكان
final getIt = GetIt.instance;

// 2️⃣ إعدادات المولد (Code Generator Configuration)
// الـ Annotation دي بتدي أوامر لمكتبة build_runner بتقولها: "إزاي تكتبي الكود نيابة عني"
@InjectableInit(
  initializerName: 'init', // اسم الدالة اللي هتتكتب جوه الملف المولد (injection.config.dart)
  preferRelativeImports: true, // يفضل استخدام المسارات النسبية (../../) بدلاً من اسم الباكيج الطويل
  asExtension: true, // مهمة جداً: بتخلي دالة التهيئة تظهر كأنها جزء من GetIt (extension method)
)

// 3️⃣ دالة التهيئة الرئيسية (Entry Point)
// دي الدالة اللي هننادي عليها في main.dart عشان تشغل النظام كله
// هي بتقوم بتشغيل دالة .init() اللي لسه هتتولد في الملف المخفي
void configureDependencies() => getIt.init();