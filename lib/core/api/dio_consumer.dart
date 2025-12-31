//3

// el class da el 3amel el 7ya5od el interface(contract) we ymdy we ykol ana 7nfez
// el 3akd el madeh esmo (implelement apiConsumer)

// 3mlna kda 3ashan law Dio 7slha 7aga agep packege tanay temedy nafs el 3akd

// ApiConsumer: (ماذا؟) إيه اللي مطلوب نعمله؟ (Get, Post).

// DioConsumer: (كيف؟) هنعمله إزاي؟ (باستخدام مكتبة Dio).

// ay 7ad 7ymdey el 3akd pta3 interface lazem y3mlo emplement
import 'package:dio/dio.dart'; // مكتبة الشبكة (ساعي البريد)
import 'package:injectable/injectable.dart'; // مكتبة الحقن (عشان الـ Singleton)
import 'api_consumer.dart'; // ملف العقد اللي إحنا لسه عاملينه

//// @Singleton kda pakol le el parnamg a3mel nos5a wa7da pas we esta5dmha tool el rnamg
///(as:ApiConsumer)   pakol le el prnamg ay 7d ytlop apiConsumer edelo Dioconsumer da el 7yt3amel
///kman m3naha en wakat mt7ep te3mel opject mn el apiConsumer mesh 7ynfa3 3ashan hwa abstarct
///fa esta5dem el DioConsumer pkl; psata  (da talama ek el S capital)
@Singleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  // final 7yt7at value wa7da mesh 7tt8er
  final Dio client;

  // hena pytpak mpda2 el Dependency Injection ele hwa ana mesh pa3mel new Dio()
  // e7na pnkol ay 7ad 3ayez ysta5edm el dio Cousnmer lazem yp3tle el client gahez
  // we ele pyp3at el client hwa el git_it
  DioConsumer({required this.client}) {
    // setup logic
    client.options.baseUrl = 'https://api.escuelajs.co/api/v1/';
    // interceptors(mo3trdat ) de el 7aga ele ptkf fe el nos penk we ben el server
    // LogInterceptor gasos pe el ma3ana el 7lw wazefto eno ytpa3 fe el consle
    // طلبت إيه؟ (request)
    // بعت إيه؟ (requestBody)
    // الرد كان إيه؟ (responseBody)
    // عشان لو حصل Error تعرف سببه فوراً.
    client.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters})  async{
  
    // hena query paramter 3ashan law 3aez data mo3ayna zay mktpna fook   
    final response = await client.get(path , queryParameters: queryParameters) ; 
    return response.data;
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? body})  async {

    final response = await client.post(path , data: body) ; 
    return response.data;
  }

}
