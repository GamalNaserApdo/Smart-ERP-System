

import 'package:smart_erp/features/auth/data/models/user_model.dart';

// da elm 3akd el pyt3amle m3a el net we rga3 data 5am 

abstract class  
AuthRemoteDataSource {

    Future<UserModel> login(String email, String password);


}

// الـ Repository 
// (في ملف Implementation)
//  بينادي 
//  على الـ 
//  DataSource.

// لو 
// الـ DataSource
//  رجع UserModel 
//  ✅ -> الـ Repository
//   يحطه
//    في Right(User).

// لو الـ DataSource 
// رمى 
// Exception 💣
//  -> الـ Repository
//   يمسكه ويحوله 
//   لـ Left(Failure).

// الخلاصة:

// DataSource: هو اللي بيجيب الداتا الخام.

// Repository: هو اللي بينظف الداتا ويغلفها عشان الإدارة.
