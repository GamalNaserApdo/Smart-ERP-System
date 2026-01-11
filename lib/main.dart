import 'package:flutter/material.dart';
import 'package:smart_erp/core/routes/app_routes.dart';
import 'package:smart_erp/features/home/presentation/pages/home_screen.dart';
import 'package:smart_erp/features/auth/presentation/pages/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/di/injection.dart';
import 'core/utils/app_constatnt.dart';

void main() async {
  // لو عكست الترتيب، أو نسيت سطر منهم، يا إما "الكهرباء هتقطع"، يا إما "مش هتلاقي العدة"! 😄
  // 1. ارفع سكينة الكهرباء ووصل الكوبري بين الكود والموبايل
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    anonKey: AppConstant.anonKey,
    url: AppConstant.BASE_URL,
  );

  // 2. رص العدة في المخزن وجهز الأدوات
  // pklm el git we 7tlha nos5a me dio   Dio()  we men authRepostry()  3ashan el donya tp2a gahza
  // kapl ma el tatpek y3mel run
  configureDependencies();

  // 3. دلوقتي بس تقدر تفتح التطبيق للمستخدم وأنت مطمن
  runApp(const MyShopApp());
}

class MyShopApp extends StatelessWidget {
  const MyShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Smart',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),

      initialRoute: Routes.login,

      routes: {
        Routes.login: (context) => const LoginScreen(),
        Routes.home: (context) => const HomeScreen(),
      },
    );
  }
}
