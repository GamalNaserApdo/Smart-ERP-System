// 4

// here   what is // injectable :: and // third party modeule means ::  //الـ Dependency Injection (حقن التبعيات)

// git it  ::
// da el dolap el marakzy aw el service locator ele pa7ot feh kol nosa5 el
// new Dio() أو new AuthRepositor()    3ashan mesh kol m7d yyge ysta5demhm y3le geded
// we yrmy el kadem   .... create one and use it everywhere

// third party modeule means ::
// da el taraf el  3        ana taraf awl , flutter taraf tany , packeges ele el nas ktpaha tarf 3

// el malaaf 3la pa3do py7twy 3la ma3lwmat le tasne3 el classes ele gaya men pra

//الـ Dependency Injection (حقن التبعيات)
//ه
//و أسلوب تصميم (Design Pattern) هدفه إلغاء الاعتماد المباشر بين الكلاسات.

// المثال البلدي (السيارة والموتور) 🚗
//(بدون DI - Tight Coupling):
// تخيل مصنع عربيات،
// جسم العربية (Car) بيصنع الموتور
//(Engine) جواه وهو بيتركب.

// injectable ::
//sha8al penzam el annotation ,,,, 3ashan a5le el injectable yt3amel m3a ay class lazem we alzek 3leh ticet esmo
// @injectable , @singleton     da ana akder a3mlo  m3a el calsses ele ana pa3melha pas law 5argy mkdrsh
// 3ashan kda 3mlt class third party 3ashan yt3amel m3a el extenal classes
// FA PAKOL  LE El el injectable ana mkdrtsh ad5ol gwa dio  pas law 7d tapl menk dio t3ala sha8al el method de
// 7trg3 dio

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ThirdPartyModule {
  // بقوله: النتيجة اللي هتطلع من الدالة دي، اعتبرها Singleton (نسخة واحدة)      Dio dio();
 @singleton 
  Dio get dio => Dio();
}

// kda injectable fahm ay 7ad 7y3wz dio and 7agy hena 


// flutter pub run build_runner build  :: 

    // da pa2a py5le el build runner ylf 3la el project kolo we yshof ay class ma3mol 3leh (ticekt) we yro7  3and el malaf da 
      // injection.config.dart  we ykol ya git it sagly da "DioConsumer"  we ay 7d ynady 3leh hatelo el nos5a de