
                                //2






// consumer means mostahalk -- this class is has functiolaity it consume the data 
// this class is responsible for go to the server and get the data (consumer)

// ليه الاسم ده مفيد؟ لأننا عاملين الكلاس ده 
//abstract (مجرد عقد). 
//إحنا بنقول للتطبيق: "يا تطبيق، أنت ليك عندي 
//ApiConsumer
// يجبلك داتا، ملكش دعوة بقى أنا بستخدم 
//Dio ولا Http 
//ولا حتى حمام زاجل". أنت ليك "مستهلك" يجيبلك الطلبات وخلاص.

abstract class ApiConsumer {

  // samenhaha query paramter 3asahn fe el get ana pp3at el data in the url (products?page=1&limit=10)
  Future<dynamic> get(String path , {Map<String , dynamic>? queryParameters}) ; 
  // called it body because el data ptt7at in the body of request 
  Future<dynamic> post(String path , {Map<String , dynamic>? body}) ;







  // // to make this class singleton pelataraeka el 3adaya 
  // // 73mle function ptreturn opject we pttchek law el opject not null 
  // // 7trg3lk nafs ek l opject we law pe null 7t3ml opject geded 

  // // _ privte 3ashan ma7dsh y3rf yandelo 5areg el class da 
  // static ApiConsumer? _instance ;  

  // ApiConsumer._() ;  
  // static ApiConsumer getInstance() {
  //       // law pe null 7tsawy el privte constarctor
  //     _instance ??= ApiConsumer._() ; 
  //     return _instance! ;
  // } 


  // awl p2a ma pa3mel @singelton fook el class da kolo pt3ml fe lama7 el pasr



}