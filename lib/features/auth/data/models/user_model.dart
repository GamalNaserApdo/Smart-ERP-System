import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.role,
    required super.token,
  });

  factory UserModel.fromSupabase(Map<String, dynamic> json) {
    // 1. استخراج الميتا داتا بأمان
    final Map<String, dynamic> metadata = json['user_metadata'] ?? {};

    return UserModel(
      // ✅ معالجة الـ ID والإيميل
      id: json['id']?.toString() ?? "",
      email: json['email']?.toString() ?? "",

      // ✅ تصحيح الاسم: بنجيبه من user_metadata
      name: metadata['name']?.toString() ?? "User",

      // ✅ تصحيح الـ Role: الكود الصحيح للوصول للمفتاح
      role: metadata['role']?.toString() ?? "employee",

      // ✅ تصحيح التوكن: لازم يكون اسمه access_token زي ما بعتناه من الداتا سورس
      token: json['access_token']?.toString() ?? "",
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? "",
      email: json['email']?.toString() ?? "",
      name: json['name']?.toString() ?? "User",
      role: json['role']?.toString() ?? "employee",
      token: json['token']?.toString() ?? "",
    );
  }
}
