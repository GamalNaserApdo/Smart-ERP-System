// el data sourve hya ele pttsal pe el internet 3ashan tenafez el matlpo menha
// ama el class da pthandl pas shakl el report el gay men el datasource

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/exceptions.dart';
import 'package:smart_erp/core/errors/failures.dart';
import 'package:smart_erp/features/home/data/data_source/home_remote_data_source.dart';
import 'package:smart_erp/features/home/data/repositories/home_repository.dart';
import 'package:smart_erp/features/models/employee_model.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  HomeRepositryImpl({required this.remoteDataSource});

  // lahez hena enha ptrga3 Either kza aw kza ama el datasource ptrg3 error 3latool
  @override
  Future<Either<Failure, int>> getEmployeesCount() async {
    try {
      final count = await remoteDataSource.getNumberOfEmployees();
      return Right(count);

      // hena  3ashan law 7asl error el app may3mlsh crash fa el repo py7wlha le resala had2a esmha Server FAilur
    } on ServerException {
      return Left(ServerFailure("Failed To Featch Data"));
    }
  }

  @override
  Future<Either<Failure, List<EmployeeModel>>> getAllEmployee() async {
    try {
      final employees = await remoteDataSource.getAllEmployee();
      return Right(employees);
    } on ServerException {
      return Left(ServerFailure("Failed To Loda Employees"));
    }
  }
}

// el farak pen el data source and el repo pe kol wdo7

// //مثال من الحياة الواقعية (عشان تثبت)
// تخيل أنك (الـ UI) مدير شركة، وعايز بضاعة من الميناء.

// DataSource (سائق الشاحنة):

// مهمته يروح الميناء (Supabase) يجيب البضاعة.

// لو الطريق مقطوع أو الشاحنة عطلت، السائق بيبعتلك استغاثة ويصرخ "الحقني الشاحنة ولعت!" (Throw Exception). هو مبيعرفش يتصرف.

// Repository (مدير المخازن):

// أنت كمدير شركة بتكلم مدير المخازن، مش السواق.

// مدير المخازن بيبعت السواق.

// لو السواق رجع بالبضاعة، مدير المخازن بيغلفها ويديهالك (Right).

// لو السواق عمل حادثة، مدير المخازن مش بيخليك تشوف الحادثة. بيجيلك مكتبك ويقولك بوقار: "عذراً سيدي، هناك تأخير في الشحن بسبب ظروف الطريق" (Left/Failure).

// الخلاصة: الـ Repository هو "الدرع الواقي" الذي يحمي تطبيقك من الانهيار، ويحول الأخطاء البرمجية (Exceptions) إلى أخطاء منطقية (Failures) يمكن عرضها للمستخدم.
