// 3rfna en el userModel hwa awl malaf pyt3amel m3a el data el gaya men supabase
// hwa el pnsp feh el paynat  // esmo el kalep

// el class da p2a esmo el worker  da el pyro7 ygep el data men supabase
// 3ashan yspo fe le kalep da  fahmat ?? fe kalp el hwa userModel
// we feh worker pysop fe el kalep ele hwa el class da

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/exceptions.dart';
import 'package:smart_erp/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:smart_erp/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// hena de yafta ma7tota 3ashan el injctable yshofha we y3mlha el injection
// paklo  lma 7ad ytlp menk opject men AuthRemoteDataSource a3mel nos5a wa7da
//pas men el class da SupabaseAuthDataSource
@LazySingleton(as: AuthRemoteDataSource)
class SupabaseAuthDataSource implements AuthRemoteDataSource {
  // kda ana hkalm subabase el line el 7tktap da shapah sma3t el phone
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      debugPrint("email is $email");

      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        debugPrint("response.user is null");
        throw ServerException();
      }
      final user = response.user!;
      final session = response.session;

      final Map<String, dynamic> userData = {
        'id': response.user!.id,
        'email': response.user!.email,
        "user_metadata": response.user!.userMetadata ?? {},
        "access_token": response.session?.accessToken ?? "",
      };
      debugPrint("✅ Login Data Prepared: $userData");

      return UserModel.fromJson(userData);
    } on AuthException catch (e) {
      debugPrint("🔥 Supabase Auth Error: ${e.message}");
      throw ServerException();
    } catch (e) {
      debugPrint("🔥 General Error: $e");
      throw ServerException();
    }
  }
  // l7d hena ana etslat pe supabase we gept menha el data

  // 7alayan  pa2a el wsal pen el supabase we pen w UerModel

  // / e7na pen3mel ay fook hena  ?  el subabase gaptly opject fa ana pfkk
  //el opjcet da we na5od meno el 7agat ele thmna we n7thm fe map
  //// we pa3den neslmha le el usermodel we nkolo tl3lna kae2n geded nkdr
  ///// nesta5demo fe el taptek
}
