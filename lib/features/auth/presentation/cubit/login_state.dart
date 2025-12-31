


// ana mesh mlaf mostakel ana tapa3 malaf el login_cubit.dart
// 3ashan akder asa5dem ay vrables henak 7ta law privte
part of 'login_cubit.dart';


// ma3mol abstarct 3ashan da el el class el raesy mafesh 7d  7ygee ykoly ana el state 
// ptat3ae login state lazem y7dd (success ,  eror)
//we Equtable 3ashan nmn3 ta7des el shasha law el 7ala hya hya mt8ertsh  
abstract class LoginState extends Equatable {

  const LoginState(); 

// mafehash 7aga 3ashan el tape3e eny mesh pkaren 7aga 
// ela law el classes ele ta7t 7ddt 7aga tanaya 
  List<Object> get props => []; 
}

// da py7sal awl ma el app yfta7 pykon 7kol fadaya and button login
class LoginInitial extends LoginState {}

// lma tdos 3la button and kapl ma el server yrd  
// el button login y5tfy and indicator yzhar 
class LoginLoading extends LoginState {}

// da py7sal lma el server yrd we ykool el password sa7 
class LoginSuccess extends LoginState {
  final User user  ; 
  LoginSuccess(this.user);
}

class LoginError extends LoginState {
  final String message ;  // de el messag eele el repostry p3ttha zay invlaid pass
  const LoginError(this.message); 

  // hena pakol le el system law galk 5ta2en zay pa3d karen el rsayel
  List<Object> get props => [message];
}

// 💡 الخلاصة
// الشاشة بتسأل الـ Cubit: "إنت مزاجك إيه دلوقتي؟".

// لو قال Initial: ارسم فورم.

// لو قال Loading: ارسم سبينر.

// لو قال Success: افتح الصفحة اللي بعدها.

// لو قال Error: طلع رسالة حمراء.

