// this is the brain of the screen , this take the commands from the screen and process it
// and say to the screen what must be draw

// ya complier malaf el login_state goza la ytgza2 meny
// da py5leney asta5dem el states el maktopen fe el class el tany we kanehm maktopen fe el class da
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_erp/core/errors/failures.dart';
import 'package:smart_erp/features/auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_erp/features/auth/domain/entities/user.dart';

part 'login_state.dart';

// pnady 3a el ma5zen get it 3ashan y7ot el class da 3ando 3ashan kma 7d ytlpo
// extend Cubit<LoginState> 3ashan akol en el class da hwa el pyder el states el mawgoda fe el loginState
@injectable
class LoginCubit extends Cubit<LoginState> {
  // tapa3an zay m7na a3refen m7dsh pyshta8l pe eedo fe el ma5ropa de kol wa7d 3aez mosa3d
  // fa el cubit me7taga el usecase tesa3dha we teklm el reposatry makanha
  final LoginUsecase loginUsecase;

  LoginCubit(this.loginUsecase)
    : super(LoginInitial()); // 3ashan y3ml el initial state
  // yp2a ked aawl ma el el cubit ywslo loginUseCase object el shahsa 3la tol 7tp2a inital State

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    // emit de le microphone ele el cubit ptklm peh el shsahsa // la tasa en emit pta5od state
    emit(LoginLoading());

    // hena el mafrod 7yrga3 el box pta3 Either
    // 5ale palk ana 3ashan mesamy el method ele pta5od el email we el password de  pe esm call
    // fe class el UseCase fa hena pnadeha pe esm el opject 3ady
    final result = await loginUsecase(email: email, password: password);
    // fold de 7apipt el malliaen de me maktpt dartz we de ptstakepl Either box
    // we tekolo ana m3rfsh fek eeh pas 7dek dalten tenafez wa7da menhm
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}


// 💡 الخلاصة
// الكيوبت ده هو "المايسترو":

// يقول للموسيقة "ابدئي" (Loading).

// يستنى العازف يخلص (await UseCase).

// لو العزف نشاز -> يوقف الحفلة (Error).

// لو العزف ممتاز -> يحيي الجمهور (Success).

// واضح كده دور الـ fold والـ emit؟ دول أهم أداتين في جعبة مطور الـ Bloc! 🛠️