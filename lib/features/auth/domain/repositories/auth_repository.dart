

import 'package:dartz/dartz.dart';
import 'package:smart_erp/core/errors/failures.dart';
import 'package:smart_erp/features/auth/domain/entities/user.dart';

abstract class AuthRepository {

  Future<Either<Failure , User>>login({required String email
   , required String password});

}