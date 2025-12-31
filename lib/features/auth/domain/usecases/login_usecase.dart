import 'package:dartz/dartz.dart'; 
// 3ashan equtable we ne3rf nrga3 success or error
import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/failures.dart';
import 'package:smart_erp/features/auth/domain/entities/user.dart';
import 'package:smart_erp/features/auth/domain/repositories/auth_repository.dart';
// 3ashan el class el 7pneh yd5ol el ma5azan autmatic 



// lazy ya3ne matsn3wsh ela  law 7ad talpo 3ashan pas el app yfta7 psr3a
/// singletong ya3ne ensha2 mra wa7da fakat , mesh ay 7ad y3mel login tesna3 class 
/// geded wafr fe el memory 
@lazySingleton // عشان الـ Injectable يعرف يصنعه
class LoginUsecase {

  // leeh ? 3ashan el login use case ytlp men el Repository eno ynfez el 3akd 
  // we yrga3 user 
  final AuthRepository repository ; 

  // leeh ? awl ma el tatpek ushta8al el get it 7yeegy 3ashan ysna3 el login use case
  // 7ylakeh me7tag repositry , injectable 7ydwer fe el ma5azn men py7kk shrot 
  // el auth repostry ? 7ylaky auth repostr el 7n3mlo pa3d shwya 
  LoginUsecase(this.repository);

  Future<Either<Failure, User>> call({
    required String email , required String password}) 
    async {
      // ele py7sal hena en el moder use case pysha8al el repostry ele tateh 
      // pydelo el email we el password 

      // pa3den await ya3ne 7stnha l7d my5las sho8lo 

      //el mozaf(repostry ) yrga3 sandok either we el usecase yrg3a ll cupit 
      return await repository.login(email: email , password: password) ;
    
    }


}
// 🎬 ملخص السيناريو (The Movie)
// Cubit: بينادي loginUseCase.call(email, pass).

// UseCase: بياخد الطلب، ويبص للموظف ب0تاعه (Repository) ويقوله: "نفذ العقد ده وهاتلي النتيجة".

// Repository: (لسه هنكتبه) بياخد الطلب، يروح لـ DataSource (اللي عملناه Mock)، يجيب الداتا، يحولها، ويرجعها في صندوق Either.

// UseCase: يستلم الصندوق ويسلمه للـ Cubit.