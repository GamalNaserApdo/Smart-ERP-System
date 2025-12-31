import 'package:equatable/equatable.dart';

// equatable de maktpa esmha el twa2m pasta5demha 3ashan el pc aslana
// lma pyyge ykaren 7agten pykarenh pe el place pta3hm in the memory
// ya3ne law motashaphen fa pelnespa le el pc mo5tlfen
// el packege de ptkolo la2 pos 3la mo7twahem
// 3asahan maslan law fe 7ad esmo ahemd hassan 3amel login we geh 3ml  login mra tanya
// mata3dsh pena2a el shahsa mra tanay we da 7ysra3 el app
class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String role;
  final String token;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.token,
  });

  // pa7ot p2a kol ele fook da 3ashan akaren mapen 2opjetc from user easily
  // mna 7karen pynathm mesh maknahm fe el meomry
  @override
  List<Object?> get props => [id, email, name, role, token]; // 3ashan el taswek m3a el server
}
