
// hena fe el folder da  pynzaf el data el 5am el gapha el folder ele esmo datasource

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/exceptions.dart';
import 'package:smart_erp/core/errors/failures.dart';
import 'package:smart_erp/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:smart_erp/features/auth/domain/entities/user.dart';
import 'package:smart_erp/features/auth/domain/repositories/auth_repository.dart';

// hena pardo kaeny paklo ya get it law 7ad galk we ma3ah 3akd authRepositry fa edelo nos5a men el class da 
// AuthRepositoryImpl     // pel3arapy pasta5dem el AuthRepositoryImpl 3ashan a3mel opject men AuthRepository
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

// el class da gaylo data men el remoteDataSource hwa 7YNzFHa we y8lfha 
final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource) ;

// DE HENA LEH P2A 3ashan e7na w3dna el domain layer enna nrga3 pe box  
// mawgod yameno el user we shmala el moshkla 
  @override
  Future<Either<Failure, User>> login({required String email, required String password}) async {
     try{
       // hena talapana men el el masdr ygep el data 
      final userModel = await remoteDataSource.login(email, password) ; 

    // mesh ana 3aml either ? ya3ne 3andy right we left 
      return Right(userModel) ; 
     }on ServerException{
      return Left(ServerFailure("Invalied Email or password")) ;
     }
     catch(e){
      return Left(ServerFailure(e.toString())) ;
     }
  }
  
}




