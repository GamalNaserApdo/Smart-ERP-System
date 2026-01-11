import 'package:flutter/material.dart';

class AppColors {
  // الألوان الرئيسية (من التصميم)
  static const Color primary = Color(0xFF9FB588);    // الزيتوني الفاتح (Sage Green) - للأزرار والتبويبات النشطة
  static const Color onPrimary = Color(0xFF1A1C1E);  // لون النص اللي هيتكتب فوق الزرار الزيتوني (غامق)

  static const Color secondary = Color(0xFFE6A35C);  // البرتقالي الهادئ (للرسوم البيانية والتنبيهات)
  
  // الخلفيات (Dark Theme)
  static const Color background = Color(0xFF141414); // الخلفية الكحلي الغامقة جداً (تقريباً أسود)
  static const Color surface = Color(0xFF1E1E1E);    // لون الكروت والقوائم الجانبية (أفتح سنة بسيطة)
  static const Color inputField = Color(0xFF2C2C2C); // لون حقول الإدخال

  // النصوص
  static const Color textPrimary = Color(0xFFFFFFFF);      // أبيض ناصع للعناوين
  static const Color textSecondary = Color(0xFFAAAAAA);    // رمادي للنصوص الفرعية
  
  // الحدود والفواصل
  static const Color border = Color(0xFF333333);
  
  // ألوان الحالة
  static const Color success = Color(0xFF9FB588); // نفس لون البراند
  static const Color error = Color(0xFFCF6679);
}