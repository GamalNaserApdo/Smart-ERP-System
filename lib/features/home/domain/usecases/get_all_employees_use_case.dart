
// la tansa en folde el use case kolo ma3mol 3ashanytpak goz2 el single repsonbality
// el amalaf da leh wazefa wa7da pas we hya pygeep el employee fakat 

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/failures.dart';
import 'package:smart_erp/features/home/data/repositories/home_repository.dart';
import 'package:smart_erp/features/models/employee_model.dart';

/// ya flutter mata3mlsh opject men el class da ele lma 7ad y3mlo 
/// we once enk te3mlo  esta5demo toool fatrt tash8el el tatpek 
@lazySingleton
class GetAllEmployeesUseCase {

  // el class da pya5od elm opject da 3asha ytlp meno eno ygeep el data 
  // we mesh leh da3aw hwa 7ygepha meenne 
   final HomeRepository repository ;

    GetAllEmployeesUseCase({required this.repository}) ; 

// esmha  call 3aahasna akder asta5demha pe esm el el calss pta3ha
   Future<Either<Failure, List<EmployeeModel>>> call() async {
    return await repository.getAllEmployee();
  }


}