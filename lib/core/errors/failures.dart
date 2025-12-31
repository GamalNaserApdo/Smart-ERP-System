

import 'package:equatable/equatable.dart';


// i made Faliur class to avoid throw exception e7na pnpny tatpek keper 
// fa dapymsel ay mosypa pt7el fe el app 
// kodam mmken ne3mle cache falilur aw offilne failur fen5le el user y3rf ytsraf

// wares men equatble 3asahn lma yyge ykaren el errors yshof ele feha 
// 3ashan myknonsh fe 2 eroor nafs el 7aga we yshofhm mo5tlfen

// kman sapp law maslan el tatpek raga3 intenrt error we el user press retry 
// law mesh warsen men equatable fa el cubit 7tshof el error 7aga 8er el awla 
// we 7t3mel rebuild tany we da pykll el perfromanc pta3 el tatpek
abstract class Failure extends Equatable {

  final String message ; 

  const Failure(this.message);

  // props here is properites pakol le el computer pos 3la el propeties ele esmha 
  // mesage we enta ptkaren
  @override
    List<Object> get props => [message];
}



class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}
