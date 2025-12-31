import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/exceptions.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart'; // 👈 لازم تستدعي ملف العقد

// 👇 السطر ده هو الحل! (بنسجله بصفته AuthRemoteDataSource)
@LazySingleton(as: AuthRemoteDataSource) 
class MockAuthDataSource implements AuthRemoteDataSource {
  
  @override
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // محاكاة التأخير

    if (email == "admin@erp.com" && password == "123456") {
      return const UserModel(
        id: "1",
        email: "admin@erp.com",
        name: "Admin User",
        role: "admin",
        token: "fake_token_123",
      );
    } else {
      throw ServerException();
    }
  }
}