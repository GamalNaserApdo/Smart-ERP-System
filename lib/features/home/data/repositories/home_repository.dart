
// هذا الملف هو "عقد العمل"
// (The Contract)
//  الذي يحدد قواعد اللعبة بين طبقة البيانات (Data Layer) وطبقة العرض
//  (Presentation Layer).


// el data sourve hya ele pttsal pe el internet 3ashan tenafez el matlpo menha 
// ama el class da pthandl pas shakl el report el gay men el datasource
import 'package:dartz/dartz.dart';
import 'package:smart_erp/core/errors/failures.dart';
import 'package:smart_erp/features/models/employee_model.dart';


abstract class HomeRepository {
  Future<Either<Failure , int>> getEmployeesCount();

  // hena 7ystlam el natega el gaya men el home data source
  Future<Either<Failure , List<EmployeeModel>>> getAllEmployee() ;

  // hena talat 5atwa 5ale palk pa3d mna 3mlt el employee model and ro7ot le el home datasource 
  //// 7ataet feha el metohd ele 7tgeep el data mn el database(supabase)
  /// get hena 3ashan de el layer ele ptstakepel el data men el data Source 

}