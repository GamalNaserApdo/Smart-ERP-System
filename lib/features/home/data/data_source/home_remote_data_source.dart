// mesh  e7na kolna en fe nafs el folder el 5as pe el home mawgod feh
// pagges ?? el pages feha home_screen  we 3aez ele ygpha el data men subabse
// el serice ptpda2 men 3andy hna

// هذا الكود هو "الجندي المجهول" الذي يقوم بالعمل الشاق: الاتصال بـ Supabase وجلب عدد الموظفين. لقد كتبته باحترافية تامة وفقاً لـ Clean Architecture.

import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/exceptions.dart';
import 'package:smart_erp/features/home/data/data_source/home_remote_data_source.dart';
import 'package:smart_erp/features/models/employee_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// da ele py5pat 3la el supabase we yklha haty el data
abstract class HomeRemoteDataSource {
  // hena ana 3amel interface 3ashan ay class 3aez yshta8al kamsdr ll payanat lazem y3mlo implemnt
  // wa peltaly 7nfez this fnction
  Future<int> getNumberOfEmployees();

  Future<List<EmployeeModel>> getAllEmployee();
}

// mat3mlsh 8er nos5a wa7da men el class da we kman mesh awl ma arun
// estna lma el user yod5ol el safa7 pta3to
@LazySingleton(
  as: HomeRemoteDataSource,
) // ama de (as kza kza ) ya3ne law 7ad talap opject edelo el impl
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  // da ele 7ytshal feh adat el etsal pe el subase
  final SupabaseClient supabaseClient;

  // e7na hena pnlp en el object() da ygelena men pra (Dependency Injection)
  HomeRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<int> getNumberOfEmployees() async {
    try {
      // hena ana 3dthm pas ma5lthosh ygphmly  kolhm fahmny  3ashan el myp2a tekel
      final response = await supabaseClient
          .from("employees")
          .count(CountOption.exact);

      return response;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<EmployeeModel>> getAllEmployee() async {
    try {
      final response = await supabaseClient.from("employees").select("*");

      final List<dynamic> data = response;

      // map ele pta5od mney kol saf josn we ptd5lo gwa from json we pytla3 employee model
      return data
          .map<EmployeeModel>((json) => EmployeeModel.fromJson(json))
          .toList();

      // la7ad hena ele 3mlto hwa eny 3arft el model pta3 el emloyee
      // we geet hena 3ashan aklm el server we amlah
      // el 5atwa el tanay hya elreposatry ele ptstlm el natega men el dataSource
    } catch (e) {
      throw ServerException();
    }
  }
}
